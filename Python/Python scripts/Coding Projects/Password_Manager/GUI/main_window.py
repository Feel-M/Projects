import random
import string
import sys
import time

from PyQt5.QtWidgets import (
    QApplication, QMainWindow, QWidget, QVBoxLayout, QLabel,
    QPushButton, QLineEdit, QTextEdit, QHBoxLayout, QTableWidget,
    QTableWidgetItem, QHeaderView, QDialog, QFormLayout, QSpinBox,
    QCheckBox, QMessageBox
)
from PyQt5.QtGui import QFont
from PyQt5.QtCore import Qt, QEvent, QTimer

from Storage.database import is_master_password_set, set_master_password, verify_master_password, init_db, \
    insert_credential, get_all_credentials


class PasswordEntryDialog(QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Add Password Entry")
        self.setMinimumWidth(400)
        layout = QFormLayout()

        self.title_input = QLineEdit()
        self.username_input = QLineEdit()
        self.password_input = QLineEdit()
        self.url_input = QLineEdit()
        self.notes_input = QTextEdit()

        layout.addRow("Title:", self.title_input)
        layout.addRow("Username:", self.username_input)
        layout.addRow("Password:", self.password_input)
        layout.addRow("URL:", self.url_input)
        layout.addRow("Notes:", self.notes_input)

        self.save_btn = QPushButton("Save")
        layout.addRow(self.save_btn)

        self.setLayout(layout)
class PasswordEntryDialog(QDialog):
    def __init__(self, data=None):
        super().__init__()
        self.setWindowTitle("Edit Password Entry" if data else "Add Password Entry")
        self.setMinimumWidth(400)
        layout = QFormLayout()

        self.title_input = QLineEdit()
        self.username_input = QLineEdit()
        self.password_input = QLineEdit()
        self.url_input = QLineEdit()
        self.notes_input = QTextEdit()

        layout.addRow("Title:", self.title_input)
        layout.addRow("Username:", self.username_input)
        layout.addRow("Password:", self.password_input)
        layout.addRow("URL:", self.url_input)
        layout.addRow("Notes:", self.notes_input)

        self.save_btn = QPushButton("Save")
        layout.addRow(self.save_btn)

        self.setLayout(layout)

        if data:
            self.title_input.setText(data["title"])
            self.username_input.setText(data["username"])
            self.password_input.setText(data["password"])
            self.url_input.setText(data["url"])
            self.notes_input.setText(data["notes"])

    def get_data(self):
        return {
            "title": self.title_input.text(),
            "username": self.username_input.text(),
            "password": self.password_input.text(),
            "url": self.url_input.text(),
            "notes": self.notes_input.toPlainText()
        }

class PasswordGeneratorDialog(QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Password Generator")
        layout = QFormLayout()

        self.length_input = QSpinBox()
        self.length_input.setRange(6, 64)
        self.length_input.setValue(16)

        self.uppercase_cb = QCheckBox("Include Uppercase")
        self.lowercase_cb = QCheckBox("Include Lowercase")
        self.digits_cb = QCheckBox("Include Digits")
        self.symbols_cb = QCheckBox("Include Symbols")

        self.generate_btn = QPushButton("Generate Password")
        self.generated_password = QLineEdit()
        self.generated_password.setReadOnly(True)
        self.generate_btn.clicked.connect(self.generate_password)

        self.copy_btn = QPushButton("Copy")
        self.copy_btn.clicked.connect(self.copy_to_clipboard)
        layout.addRow(self.copy_btn)

        layout.addRow("Length:", self.length_input)
        layout.addRow(self.uppercase_cb)
        layout.addRow(self.lowercase_cb)
        layout.addRow(self.digits_cb)
        layout.addRow(self.symbols_cb)
        layout.addRow(self.generate_btn)
        layout.addRow("Generated:", self.generated_password)

        self.setLayout(layout)

    def copy_to_clipboard(self):
        clipboard = QApplication.clipboard()
        clipboard.setText(self.generated_password.text())

    def generate_password(self):
        length = self.length_input.value()
        characters = ""

        if self.uppercase_cb.isChecked():
            characters += string.ascii_uppercase
        if self.lowercase_cb.isChecked():
            characters += string.ascii_lowercase
        if self.digits_cb.isChecked():
            characters += string.digits
        if self.symbols_cb.isChecked():
            characters += string.punctuation

        if not characters:
            self.generated_password.setText("Select at least one set")
            return

        password = ''.join(random.choice(characters) for _ in range(length))
        self.generated_password.setText(password)


class PasswordManagerUI(QMainWindow):
    def __init__(self):
        super().__init__()
        self.password_data = {}

        self.setWindowTitle("Secure Password Manager")
        self.setGeometry(200, 100, 800, 600)

        # Central Widget
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        layout = QVBoxLayout()

        # Header
        title = QLabel("Secure Password Vault")
        title.setFont(QFont("Arial", 18, QFont.Bold))
        title.setAlignment(Qt.AlignCenter)
        layout.addWidget(title)

        # Top-right controls (Refresh and Lock)
        top_right_layout = QHBoxLayout()
        top_right_layout.addStretch()

        # Refresh Button
        self.refresh_btn = QPushButton("↻")
        self.refresh_btn.setFixedSize(30, 30)
        self.refresh_btn.setToolTip("Refresh table")
        top_right_layout.addWidget(self.refresh_btn)

        # Lock Button
        self.lock_btn = QPushButton("🔒")
        self.lock_btn.setFixedSize(30, 30)
        self.lock_btn.setToolTip("Lock application")
        top_right_layout.addWidget(self.lock_btn)

        # Add to main layout
        layout.addLayout(top_right_layout)

        # Table
        self.table = QTableWidget(0, 5)
        self.table.setHorizontalHeaderLabels(["Title", "Username", "Password", "URL", "Notes"])
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        layout.addWidget(self.table)
        self.table.setEditTriggers(QTableWidget.NoEditTriggers)
        self.load_data()

        # Buttons
        btn_layout = QHBoxLayout()

        # Common style for all buttons
        button_style = """
            QPushButton {
                padding: 6px 12px;
                border: 1px solid #555;
                border-radius: 6px;
                background-color: #f0f0f0;
            }
            QPushButton:hover {
                background-color: #dcdcdc;
            }
        """

        # Define buttons with symbols
        self.add_btn = QPushButton("➕ Add")
        self.edit_btn = QPushButton("✏️ Edit")
        self.delete_btn = QPushButton("🗑️ Delete")
        self.copy_btn = QPushButton("📋 Copy Password")
        self.generate_btn = QPushButton("⚙️ Generate Password")

        # Apply the same style to all buttons and add to layout
        for btn in [self.add_btn, self.edit_btn, self.delete_btn, self.copy_btn, self.generate_btn]:
            btn.setStyleSheet(button_style)
            btn_layout.addWidget(btn)

        # Add the layout to the main layout (above the table ideally)
        layout.addLayout(btn_layout)

        # Set layout
        central_widget.setLayout(layout)

        # Connect dialogs (placeholder handlers)
        self.add_btn.clicked.connect(self.show_add_dialog)
        self.edit_btn.clicked.connect(self.show_edit_dialog)
        self.delete_btn.clicked.connect(self.delete_selected_entry)
        self.copy_btn.clicked.connect(self.copy_selected_password)
        self.generate_btn.clicked.connect(self.show_password_generator)
        self.lock_btn.clicked.connect(self.lock_application)
        self.refresh_btn.clicked.connect(self.load_data)

        #Auto Lock
        self.idle_timeout = 300  # seconds (e.g., 5 minutes)
        self.last_activity = time.time()

        # Start a timer to check for inactivity
        self.idle_timer = QTimer()
        self.idle_timer.timeout.connect(self.check_idle)
        self.idle_timer.start(10000)  # check every 10 seconds

        # Install global event filter to monitor activity
        self.installEventFilter(self)

    def show_add_dialog(self):
        dialog = PasswordEntryDialog()
        dialog.save_btn.clicked.connect(lambda: self.save_entry(dialog))
        dialog.exec_()

    def save_entry(self, dialog):
        data = {
            "title": dialog.title_input.text(),
            "username": dialog.username_input.text(),
            "password": dialog.password_input.text(),
            "url": dialog.url_input.text(),
            "notes": dialog.notes_input.toPlainText()
        }

        if not data["title"] or not data["password"]:
            QMessageBox.warning(self, "Error", "Title and password cannot be empty")
            return

        insert_credential(
            data["title"],
            data["username"],
            data["password"],
            data["url"],
            data["notes"]
        )

        dialog.accept()
        self.load_data()

    def show_edit_dialog(self):
        selected = self.table.currentRow()
        if selected < 0:
            QMessageBox.warning(self, "Error", "Please select a row to edit.")
            return

        # Extract current row data
        entry_id = list(get_all_credentials())[selected][0]  # Get ID from real DB
        data = {
            "title": self.table.item(selected, 0).text(),
            "username": self.table.item(selected, 1).text(),
            "password": self.password_data[selected]["password"],
            "url": self.table.item(selected, 3).text(),
            "notes": self.table.item(selected, 4).text()
        }

        dialog = PasswordEntryDialog(data)
        dialog.save_btn.clicked.connect(lambda: self.save_edit(dialog, entry_id))
        dialog.exec_()

    def save_edit(self, dialog, entry_id):
        updated_data = dialog.get_data()

        if not updated_data["title"] or not updated_data["password"]:
            QMessageBox.warning(self, "Error", "Title and password cannot be empty")
            return

        from Storage.database import update_credential  # Import if not already done
        update_credential(
            entry_id,
            updated_data["title"],
            updated_data["username"],
            updated_data["password"],
            updated_data["url"],
            updated_data["notes"]
        )

        dialog.accept()
        self.load_data()

    def delete_selected_entry(self):
        selected = self.table.currentRow()
        if selected < 0:
            QMessageBox.warning(self, "Error", "Please select a row to delete.")
            return

        # Confirm deletion
        reply = QMessageBox.question(
            self, "Confirm Delete",
            "Are you sure you want to delete this entry?",
            QMessageBox.Yes | QMessageBox.No
        )

        if reply == QMessageBox.Yes:
            # Get the correct ID from DB
            entry_id = get_all_credentials()[selected][0]

            from Storage.database import delete_credential  # If not already imported
            delete_credential(entry_id)

            self.load_data()

    def copy_selected_password(self):
        selected = self.table.currentRow()
        if selected < 0:
            QMessageBox.warning(self, "Error", "Please select a row to copy the password.")
            return

        password = self.password_data.get(selected, {}).get("password")
        if password:
            clipboard = QApplication.clipboard()
            clipboard.setText(password)
            QMessageBox.information(self, "Copied", "Password copied to clipboard.")
        else:
            QMessageBox.warning(self, "Error", "Unable to find the password.")

    def eventFilter(self, source, event):
        if event.type() in (QEvent.MouseMove, QEvent.KeyPress, QEvent.MouseButtonPress):
            self.last_activity = time.time()
        return super().eventFilter(source, event)

    def check_idle(self):
        if time.time() - self.last_activity > self.idle_timeout:
            self.lock_application()
            self.last_activity = time.time()  # Reset after locking

    def lock_application(self):
        self.hide()  # Hide the main window temporarily

        login_dialog = MasterPasswordDialog(mode="verify")
        login_dialog.exec_()

        if login_dialog.success:
            self.show()  # Re-show the main window if login successful
            self.load_data()  # Reload data just in case
        else:
            QApplication.quit()  # Exit if login fails

    def show_password_generator(self):
        dialog = PasswordGeneratorDialog()
        dialog.exec_()

    def load_data(self):
        self.table.setRowCount(0)  # Clear current table content
        self.table.setEditTriggers(QTableWidget.NoEditTriggers)

        credentials = get_all_credentials()
        for row_index, (entry_id, title, username, password, url, notes) in enumerate(credentials):
            self.table.insertRow(row_index)

            self.password_data[row_index] = {
                "password": password,
                "visible": False
            }

            self.table.setItem(row_index, 0, QTableWidgetItem(title))
            self.table.setItem(row_index, 1, QTableWidgetItem(username))
            self.table.setItem(row_index, 3, QTableWidgetItem(url))
            self.table.setItem(row_index, 4, QTableWidgetItem(notes))

            # Create password cell with Show/Hide button
            password_widget = QWidget()
            layout = QHBoxLayout()
            label = QLabel("••••••••")
            button = QPushButton("Show")
            button.setFixedWidth(50)
            button.clicked.connect(lambda _, r=row_index, l=label, b=button: self.toggle_password(r, l, b))
            layout.addWidget(label)
            layout.addWidget(button)
            layout.setContentsMargins(0, 0, 0, 0)
            password_widget.setLayout(layout)
            self.table.setCellWidget(row_index, 2, password_widget)

    def toggle_password(self, row, label, button):
        """Toggles password visibility for a specific row."""
        entry = self.password_data[row]
        if entry["visible"]:
            label.setText("••••••••")
            button.setText("Show")
        else:
            label.setText(entry["password"])
            button.setText("Hide")
        entry["visible"] = not entry["visible"]
class MasterPasswordDialog(QDialog):
    def __init__(self, mode="verify"):
        super().__init__()
        self.setWindowTitle("Master Password")
        self.setMinimumWidth(300)
        self.success = False

        layout = QFormLayout()
        self.password_input = QLineEdit()
        self.password_input.setEchoMode(QLineEdit.Password)

        if mode == "setup":
            self.confirm_input = QLineEdit()
            self.confirm_input.setEchoMode(QLineEdit.Password)
            layout.addRow("Create Password:", self.password_input)
            layout.addRow("Confirm Password:", self.confirm_input)
        else:
            layout.addRow("Enter Password:", self.password_input)

        self.submit_btn = QPushButton("Submit")
        self.submit_btn.clicked.connect(lambda: self.handle_submit(mode))
        layout.addRow(self.submit_btn)
        self.setLayout(layout)

    def handle_submit(self, mode):
        pw = self.password_input.text()
        if not pw:
            QMessageBox.warning(self, "Error", "Password cannot be empty")
            return

        if mode == "setup":
            confirm = self.confirm_input.text()
            if pw != confirm:
                QMessageBox.warning(self, "Error", "Passwords do not match")
                return
            set_master_password(pw)
            self.success = True
            self.accept()
        else:
            if verify_master_password(pw):
                self.success = True
                self.accept()
            else:
                QMessageBox.critical(self, "Error", "Incorrect master password")



if __name__ == '__main__':
    init_db()

    app = QApplication(sys.argv)

    # Check if master password exists
    if not is_master_password_set():
        setup_dialog = MasterPasswordDialog(mode="setup")
        setup_dialog.exec_()
        if not setup_dialog.success:
            sys.exit(0)
    else:
        login_dialog = MasterPasswordDialog(mode="verify")
        login_dialog.exec_()
        if not login_dialog.success:
            sys.exit(0)

    window = PasswordManagerUI()
    window.show()
    sys.exit(app.exec_())
