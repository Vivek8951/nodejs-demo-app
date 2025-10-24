import string

emails = []

for i in range(1, 451):
    suffix = ''
    num = i
    while num > 0:
        num, rem = divmod(num - 1, 26)
        suffix = chr(97 + rem) + suffix  # 97 -> 'a'
    emails.append(f"viveks98321+{suffix}@gmail.com")

with open('generated_emails.txt', 'w') as f:
    for email in emails:
        f.write(email + '\n')
