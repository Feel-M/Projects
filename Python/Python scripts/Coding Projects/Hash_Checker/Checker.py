import hashlib
import hmac
import tkinter as tk
from tkinter import filedialog, messagebox

def get_hash(filepath, hash_algorithm):
    hash_function = hashlib.new(hash_algorithm)

    with open(filepath, 'rb') as file:
        chunk = 0
        while chunk != b'':
            chunk = file.read(4096)
            hash_function.update(chunk)

    return hash_function.hexdigest()

def check_hash(filepath, given_hash, hash_algorithm):
    file_hash = get_hash(filepath, hash_algorithm)
    return hmac.compare_digest(file_hash, given_hash)

def browse_file():
    filepath = filedialog.askopenfilename()
    if filepath:
        file_entry.delete(0, tk.END)  # Clear the current text in the file entry
        file_entry.insert(0, filepath)  # Insert the selected file path

def on_check_hash():
    filepath = file_entry.get()
    given_hash = hash_entry.get()
    hash_algorithm = hash_type.get()

    if not filepath or not given_hash:
        messagebox.showerror("Input Error", "Please select a file and enter a hash to compare.")
        return

    try:
        if check_hash(filepath, given_hash, hash_algorithm):
            result_label.config(text="File is Safe", fg="green")
        else:
            result_label.config(text="File is Dangerous", fg="red")
    except Exception as e:
        messagebox.showerror("Error", f"An error occurred: {str(e)}")

def main():
    global file_entry, hash_entry, result_label, hash_type

    # Create the main window
    root = tk.Tk()
    root.title("File Hash Checker")

    # File selection section
    file_label = tk.Label(root, text="Select File:")
    file_label.grid(row=0, column=0, padx=10, pady=10)

    file_entry = tk.Entry(root, width=50)
    file_entry.grid(row=0, column=1, padx=10, pady=10)

    browse_button = tk.Button(root, text="Browse", command=browse_file)
    browse_button.grid(row=0, column=2, padx=10, pady=10)

    # Hash input section
    hash_label = tk.Label(root, text="Enter Hash:")
    hash_label.grid(row=1, column=0, padx=10, pady=10)

    hash_entry = tk.Entry(root, width=50)
    hash_entry.grid(row=1, column=1, padx=10, pady=10)

    # Hash type selection
    hash_type_label = tk.Label(root, text="Select Hash Algorithm:")
    hash_type_label.grid(row=2, column=0, padx=10, pady=10)

    hash_type = tk.StringVar(root)
    hash_type.set("md5")  # Set default value

    hash_type_dropdown = tk.OptionMenu(root, hash_type, "md5", "sha1", "sha256", "sha512")
    hash_type_dropdown.grid(row=2, column=1, padx=10, pady=10)

    # Check button
    check_button = tk.Button(root, text="Check Hash", command=on_check_hash)
    check_button.grid(row=3, column=1, padx=10, pady=10)

    # Result label
    result_label = tk.Label(root, text="", font=("Helvetica", 14))
    result_label.grid(row=4, column=1, padx=10, pady=10)

    # Start the GUI event loop
    root.mainloop()

if __name__ == "__main__":
    main()
