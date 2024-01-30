import yagmail

sender = 'anynamerandom@gmail.com' 
pip
password = 'nfsmw2011'
receiver = 'elfeell.m@gmail.com'

subject = "this is a test!!"

body = "This is what is inside the email."

message = yagmail.SMTP(user = sender, password = password)

message.send(to = receiver , subject = subject, contents = body)

print("Email Sent!!")
