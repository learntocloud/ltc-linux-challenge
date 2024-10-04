Hi, welcome to Learn to Cloud! I hear you're our new jr cloud engineer. This is phase 1 of our onboarding program. This program is meant to get you hands on skills with everything we need you to know to excel at this role. We expect it will take you about 3-6 months with a couple of hours of work a day. Let's begin with phase 1: Linux, Bash and networking.


Here we like to get hands-on ASAP, so we've got a Capture The Flag (CTF) lab for you to practice your Linux, Bash, and networking skills. Don't worry, along the way we will have tips, doc links, resources, and more to help you. Let's break down your month-long journey:

## Week 1: Environment setup

We're going to spend a few days getting your computer setup for all our labs. We expect you to be using Mac OS or a Ubuntu based machine. If you're on Windows, you'll use WSL.

### Day 1-2: Version Control

Here at L2C we use Git and GitHub for our version control. I need you to spend a few days getting up to speed with them.

- Study: [Intro to Git](https://learn.microsoft.com/training/modules/intro-to-git/)
- Action: Create a [GitHub account](https://docs.github.com/get-started/start-your-journey/creating-an-account-on-github)

Here at L2C we are big fans of GenAI abilities to help with learning. We leverage it a lot to dive deeper and clarify concepts. It's a good time for you to setup an account with any tool you'd like and start using it for your own learning. Try it out first with testing your knowledge on what version control is.

- Action: Use an AI assistant to test your understanding of the concepts. You can use this prompt as a template:
    ```
    I'm studying cloud engineering and recently learned about version control. I will provide you an explanation about it and please ask me any questions if my explanation is not clear. I want to make sure I really understand this concept so please do not correct me, simple ask questions until I get the explanation right. Here is my explanation: version control is 
    ```


We use VS Code for all our programming. It is time for you to install it. 

- Action: [Install VS Code](https://code.visualstudio.com/)
- Action: If you are working on a Windows machine (Mac and Linux users skip ahead), you'll need to setup WSL. All our labs and tools expect a Linux based environment, WSL will provide that. Follow: [Get started using Visual Studio Code with Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-vscode)

By now you should have the basics of git down and a GitHub account. Now I need you to learn about command line commands you will be using a lot.

- Study: [Command Line for Beginners – How to Use the Terminal Like a Pro](https://www.freecodecamp.org/news/command-line-for-beginners/#heading-most-common-and-useful-commands-to-use)
You're ready to get the lab copied locally (cloned) to your computer.
- Action: Using a Terminal, create a folder on your computer where you will store all your labs and projects. Name it `l2c`
Use the `mkdir` and `cd` commands for this. 
- Action: Inside your `l2c` folder, clone the lab repository
  ```
  git clone https://github.com/rishabkumar7/ltc-labs 
  ```

We use markdown for our documentation, it's important you know how to work with it.

- Study: [Communicate using markdown](https://learn.microsoft.com/en-us/training/modules/communicate-using-markdown/)
- Action: [Create a GitHub readme for your GitHub](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme#adding-a-profile-readme)
- Action: Clone your README repo to your local machine. Use VS Code to edit it and push changes back to GitHub from the terminal in VS Code.
Here is a [great guide](https://www.freecodecamp.org/news/how-to-use-markdown-in-vscode/) on using markdown with VS Code. Don't feel like you have to make a very fancy README. Write a brief description on who you are and 
add links to your socials.

### Things you should know by now

- What is version control?
- What is markdown?
- What is a git repository?
- What does it mean to clone a repository?
- git should be installed on your computer
- vs code should be installed on your computer
- WSL should be setup for Windows users
- You created a folder on your computer with the terminal and `mkdir` command
- The lab repo should be cloned locally on your computer
- Your README repo should be cloned locally on your computer

Great, when you're ready, move on.

### Day 3: AWS CLI setup

Now we're going to setup your cloud environment. Make sure you've created an account. 

- Action: [Create an account with AWS](https://aws.amazon.com/resources/create-account/)
- Action: [Getting Started with the AWS Management Console](https://aws.amazon.com/getting-started/hands-on/getting-started-with-aws-management-console/)

You should be a little familiar with the AWS console now. You can of course deploy things by clicking but we would rather you use the CLI.

- Study: [What is a CLI](https://aws.amazon.com/what-is/cli/)
- Action: [Install the AWS CLI](https://aws.amazon.com/cli/)

### Things you should know by now

- What is a CLI?
- The benefits of using a CLI vs a UI for cloud resource management.
- You created a cloud account.
- You installed a cloud cli.
- You configured the cloud cli with your account.

### Day 4: Infrastructure as Code

We will spend a lot more time on Infrastructure as Code and other DevOps practices later as all of our labs use them. For now I need you to familiarize yourself with a few Terraform (an infrastructure as code tool) concepts:

- Study: [What is IaC](https://www.hashicorp.com/resources/what-is-infrastructure-as-code)
- Study: [What is Infrastructure as Code with Terraform?](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code)
- Study: [Terraform init](https://developer.hashicorp.com/terraform/cli/commands/init)
- Study: [Terraform apply](https://developer.hashicorp.com/terraform/cli/commands/apply)
- Action: Use an AI assistant to test your understanding of the concepts. You can use this prompt as a template:
    ```
    I'm studying cloud engineering and recently learned about Infrastructure as Code. I will provide you an explanation about it and please ask me any questions if my explanation is not clear. I want to make sure I really understand this concept so please do not correct me, simple ask questions until I get the explanation right. Here is my explanation: IaC is 
    ```

Finally we need to make sure Terraform is installed

- Action: [Install Terraform](https://developer.hashicorp.com/terraform/install). For Windows users make sure you're installing it inside Ubuntu via WSL.
### Things you should know by now

- What is version control?
- What is markdown?
- What is a git repository?
- What does it mean to clone a repository?
- You've used an AI assistant to test your knowledge
- Terraform should be installed on your computer
- What does terraform init do?
- What does terraform apply do?


### Day 5: Build and access the lab!

Now you have everything you need to build your first lab!!

- Actions: 
  - In your terminal, `cd` to where the phase1 lab folder is.
  - Run `terraform init` 
  - Run `terraform apply` 
  - When prompted, type `yes` to confirm.
  - After the apply completes, note the `ctf_instance_public_ip` output. You'll use this to connect to your lab environment.
  ![Terraform Apply output](/phase1/aws/images/terraform-apply-screenshot.png)

You're going to be using SSH a lot, take some time now to learn about it.
- Study: [What is SSH](https://www.cloudflare.com/learning/access-management/what-is-ssh/)
- Action: Ensure you can SSH into the instance using the provided credentials
1. Use SSH to connect to the EC2 instance:

    ``` sh
      ssh ec2-user@<ctf_instance_public_ip>
    ```

2. When prompted for a password, enter: `CTFpassword123!`
3. Once logged in, you'll see a welcome message with instructions for your first challenge.
![ssh into the instance](/phase1/aws/images/ssh-screenshot.png)

## Weekend reading

Next week you'll dive into the CTF challenges, for the weekend we recommend you do some reading on Linux and Bash. Checkout the first 2 chapters of [linux basics for hackers](https://nostarch.com/linuxbasicsforhackers#content). We love this book and will continue to reference it.

## Week 2-4: CTF Challenges

Now that your environment is set up, you'll work through the 7 CTF challenges. Spend a few days on each challenge, using the time to research, practice, and solve each task.

Challenge 1: Find a hidden file
- Study: "Linux File System Hierarchy" - https://www.linux.com/training-tutorials/linux-filesystem-explained/
- Focus on learning about hidden files in Linux and commands like `ls` with its various options

Challenge 2: Locate a file with "secret" in its name
- Study: "Find Command in Linux" - https://www.geeksforgeeks.org/find-command-in-linux-with-examples/
- Practice using the `find` command with different options

Challenge 3: Find the largest file in a specific directory
- Study: "Sorting and Comparing Files" - https://www.gnu.org/software/coreutils/manual/html_node/Sorting-files.html
- Learn to combine commands like `find`, `sort`, and `head`

Challenge 4: Identify a user with a specific UID
- Study: "Understanding /etc/passwd File" - https://www.cyberciti.biz/faq/understanding-etcpasswd-file-format/
- Practice using commands like `grep` to search for specific patterns

Challenge 5: Locate a file with specific permissions
- Study: "Linux File Permissions" - https://chmod-calculator.com/
- Learn about octal notation for file permissions and using `find` with permission arguments

Challenge 6: Find a process running on a specific port
- Study: "Linux Networking Commands" - https://www.tecmint.com/linux-networking-commands/
- Focus on commands like `netstat`, `ss`, and `lsof` for identifying processes and ports

Challenge 7: Decode a base64 encoded message
- Study: "Base64 Encoding/Decoding" - https://en.wikipedia.org/wiki/Base64
- Learn to use the `base64` command in Linux

For each challenge:
1. Spend time studying the related concept
2. Practice relevant commands in your lab environment
3. Attempt to solve the challenge
4. If stuck, review your notes or ask for hints
5. After solving, reflect on what you learned and how it applies to real-world scenarios

Final Day: Wrap-up
- Ensure you've completed all challenges
- Clean up your AWS resources using `terraform destroy`
- Reflect on your journey and identify areas for further study

