### Task 1: Your First Script
1. Create a file `hello.sh`
2. Add the shebang line `#!/bin/bash` at the top
3. Print `Hello, DevOps!` using `echo`
4. Make it executable and run it

### Task 1: Solution
 - vim `hello.sh`
   ```#!/bin/bash
    echo "Hello DevOps this is my first script"
   ```
 - `chmod 775 hello.sh`
 - `ls -l`
 - `./hello.sh`
<img width="490" height="53" alt="image" src="https://github.com/user-attachments/assets/71fc28f7-ab3e-47ed-a948-04294365ff3a" />
<img width="549" height="55" alt="image" src="https://github.com/user-attachments/assets/f34fe4b0-abe5-4d1e-a90e-3b8fece5f91b" />

### what happend when you remove the shebang `#!/bin/bash`-
 - Removing the `#!/bin/bash` line (the "shebang") does not prevent the script from running entirely, but it changes how it is executed.
 - With `#!/bin/bash`: The operating system knows to use the /bin/bash interpreter specifically to run the script, regardless of your default shell. This ensures consistency.
 - Without `#!/bin/bash`: The script is run using your current interactive shell (e.g., if you are in Zsh, it will use zsh; if you are in Bash, it will use bash). 

---

### Task 2: Variables
1. Create `variables.sh` with:
   - A variable for your `NAME`
   - A variable for your `ROLE` (e.g., "DevOps Engineer")
   - Print: `Hello, I am <NAME> and I am a <ROLE>`
2. Try using single quotes vs double quotes — what's the difference?

### Task 2: Solution
 - `Vim variables.sh`
```
#!/bin/bash
echo "hello wellcome to devops"
read -p "what is your subh name" name
echo "Wellcome to devops TWS bacth 10 $name"
echo "you will become DevOps engineer in next 30 days $name"
```
 - `ls -l`
 - `chmod 775 variables.sh`
 - `./variables.sh`
<img width="703" height="166" alt="image" src="https://github.com/user-attachments/assets/36daf66c-8d83-47b0-88e1-d89eb98bd8f7" />

### what's the difference? between single quotes vs double quotes?
 - Single quotes ' ' treat everything literally — no variable or command expansion happens.
 - Double quotes " " allow variables, commands, and escapes to be interpreted and expanded.





