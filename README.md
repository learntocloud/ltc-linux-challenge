# Phase 1: Linux Command Line CTF Challenge

This set of progressive Capture The Flag (CTF) challenges will test your Linux command line skills. Each challenge builds upon previous concepts while introducing new ones. All flags follow the format `CTF{some_text_here}`.

> [!IMPORTANT]  
> Please complete [Phase 1 Guide](https://learntocloud.guide/phase1/) before attempting these challenges. Do not share solutions publicly - focus on sharing your learning journey instead.

## Flag Submission

Submit flags using the `verify` command:

- Check progress: `verify progress`
- Submit a flag: `verify [challenge_number] [flag]`
- Test the system: `verify 0 CTF{example}`

Example: `verify 0 CTF{example}`

```
ctf_user@ctf-vm:~$ verify 0 CTF{example}
✓ Example flag verified! Now try finding real flags.
```

## Environment Setup

Follow the setup guide for your preferred cloud provider:

- [AWS](./aws/README.md)
- [Azure](./azure/README.md)

## Challenges

### Beginner Level

#### Challenge 1: The Hidden File

Find and read a hidden file in the `ctf_challenges` directory.

- **Skills**: Basic file listing, hidden files concept
- **Hint**: Hidden files in Linux start with a special character

#### Challenge 2: The Secret File

Locate a file containing "secret" in its name within /home/ctf_user.

- **Skills**: File searching, directory navigation
- **Hint**: Explore commands that can search through directories

### Intermediate Level

#### Challenge 3: The Largest Log

Identify and read the largest file in /var/log.

- **Skills**: File size analysis, sorting, log navigation
- **Hint**: Look into commands that display file sizes

#### Challenge 4: The User Detective

Find a flag in the .profile of the user with UID 1002.

- **Skills**: User management, system files, permissions
- **Hint**: System files contain user information

#### Challenge 5: The Permissive File

Find a root-owned file with 777 permissions. The flag is the contents of this file.

- **Skills**: Permission understanding, advanced file searching
- **Hint**: Consider both ownership and permission patterns

### Advanced Level

#### Challenge 6: The Hidden Service

Identify a process on port 8080 and retrieve its flag.

- **Skills**: Process management, networking tools, service inspection
- **Hint**: Network diagnostic tools can reveal running services. Port 8080 is often used for HTTP

#### Challenge 7: The Encoded Secret

Decode a base64-encoded flag.

- **Skills**: Encoding/decoding, command piping
- **Hint**: Linux provides built-in encoding tools

#### Challenge 8: SSH Key Authentication

Configure SSH key authentication and find a hidden flag.

- **Skills**: SSH configuration, key management, security practices
- **Hint**: Pay attention to file permissions and hidden directories

### Networking tasks 

#### Challenge 9: DNS troubleshooting

DNS troubleshooting is an important skill, fix the issue and find the flag.

- **Skills**: DNS troubleshooting, file editing
- **Hints**: Consider DNS resolution (google.com), fix anything out of the ordinary, backup.

#### Challenge 10: Remote upload

Use a remote transfer application to transfer a file to the `ctf_challenges` directory and receive your flag 

- **Skills**: Upload files to remote servers
- **Hints**: scp, CyberDuck, WINscp

#### Challenge 11: Web Configuration

Find and fix the issue, access the site from your local browser by using the provided IP from Terraform. 

- **Skills**: Webhost configuration, service file config, website hosting
- **Hints**: Consider Local common config Ports (80,443, etc), restart the service after applying changes, no need to modify the Provider Network rules, this is only OS troubleshooting.

#### Challenge 12: Network Traffic Analysis

Use network capture tools to review generated network traffic and find its flag in the sent message.

- **Skills**: Network dumps, packet inspection, decoding
- **Hint**: Use previous tactics plus a new one `xxd`, you can also use flags `-X` with a certain tool, "there is nothing like home."

## Tips for Success

1. Use `man` pages to understand command options
2. Break down complex problems into smaller steps
3. Understand command combinations using pipes
4. Review basic Linux concepts from Phase 1 Guide
5. Take notes on new commands you discover

## Author

- LinkedIn: [rishabkumar7](https://linkedin.com/in/rishabkumar7)
- X/Twitter: [@rishabincloud](https://x.com/rishabincloud)

## [License](LICENSE)
