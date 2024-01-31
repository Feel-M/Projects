import socket
import common_ports

def get_open_ports(target, port_range, verbose=False):
    open_ports = []

    
    if not isinstance(port_range, list) or len(port_range) != 2:
        raise ValueError("Port range should be a list of two numbers.")

    start_port, end_port = port_range

   
    if not isinstance(start_port, int) or not isinstance(end_port, int):
        raise ValueError("Port numbers should be integers.")

    try:
        
        ip_address = socket.gethostbyname(target)
    except socket.error:
        return "Error: Invalid hostname"

    for port in range(start_port, end_port + 1):
        
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)

        
        result = sock.connect_ex((ip_address, port))

        # Check if the connection was successful (0 indicates success)
        if result == 0:
            open_ports.append(port)

      
        sock.close()

    if verbose:
        result_string = f"Open ports for {target} ({ip_address})\nPORT     SERVICE\n"
        for port in open_ports:
            service_name = common_ports.ports_and_services.get(port, "unknown")
            result_string += f"{port:<9}{service_name}\n"

        return result_string.rstrip() 
    else:
        return open_ports


