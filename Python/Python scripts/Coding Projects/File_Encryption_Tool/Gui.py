import os
from tkinter import Tk, Label, Entry, Button, Radiobutton, StringVar, filedialog, messagebox
import Encryption_Tool as Tool

def browse_file_folder():
    path = filedialog.askopenfilename(title="Select File or Folder")
    if not path:  # If no file is selected, let the user select a folder
        path = filedialog.askdirectory(title="Select Folder")
    if path:  # Only update the entry if a path is selected
        path_entry.delete(0, 'end')
        path_entry.insert(0, path)

def browse_key_file():
    key_file = filedialog.askopenfilename(title="Select Key File", filetypes=[("Key Files", "*.key")])
    key_entry.delete(0, 'end')
    key_entry.insert(0, key_file)

def generate_key_file():
    key_file = filedialog.asksaveasfilename(defaultextension=".key", filetypes=[("Key Files", "*.key")])
    if key_file:
        Tool.generate_key() # Save the generated key to the selected location
        messagebox.showinfo("Key Generated", f"Key file saved at: {key_file}")

def start_action():
    path = path_entry.get()
    key_path = key_entry.get()
    action = action_var.get()

    if not path or not key_path:
        messagebox.showerror("Error", "Please select both the file/folder path and key file.")
        return

    try:
        Tool.main(path, action, key_path)  # Call the main function from encryption_logic
        messagebox.showinfo("Success", f"{action.capitalize()}ion completed successfully.")
    except Exception as e:
        messagebox.showerror("Error", f"An error occurred: {e}")

def start_gui():
    # Initialize the main window
    root = Tk()
    root.title("File Encryption Tool")

    # Path selection
    Label(root, text="Select File or Folder:").grid(row=0, column=0, padx=10, pady=10)
    global path_entry
    path_entry = Entry(root, width=50)
    path_entry.grid(row=0, column=1, padx=10, pady=10)
    browse_button = Button(root, text="Browse", command=browse_file_folder)
    browse_button.grid(row=0, column=2, padx=10, pady=10)

    # Key file selection
    Label(root, text="Select Key File:").grid(row=1, column=0, padx=10, pady=10)
    global key_entry
    key_entry = Entry(root, width=50)
    key_entry.grid(row=1, column=1, padx=10, pady=10)
    browse_key_button = Button(root, text="Browse", command=browse_key_file)
    browse_key_button.grid(row=1, column=2, padx=10, pady=10)

    # Action selection (Encrypt/Decrypt)
    global action_var
    action_var = StringVar(value="encrypt")
    Label(root, text="Choose Action:").grid(row=2, column=0, padx=10, pady=10)
    encrypt_radio = Radiobutton(root, text="Encrypt", variable=action_var, value="encrypt")
    encrypt_radio.grid(row=2, column=1, padx=10, pady=10, sticky='w')
    decrypt_radio = Radiobutton(root, text="Decrypt", variable=action_var, value="decrypt")
    decrypt_radio.grid(row=2, column=1, padx=10, pady=10, sticky='e')

    # Start button
    start_button = Button(root, text="Start", command=start_action)
    start_button.grid(row=3, column=1, padx=10, pady=20)

    # Generate key file button
    generate_key_button = Button(root, text="Generate Key File", command=generate_key_file)
    generate_key_button.grid(row=4, column=1, padx=10, pady=10)

    # Run the application
    root.mainloop()
