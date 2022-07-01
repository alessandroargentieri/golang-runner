# Go runner

```text
 ______   ______       ______   __  __   __   __   __   __   ______   ______    
/\  ___\ /\  __ \     /\  == \ /\ \/\ \ /\ "-.\ \ /\ "-.\ \ /\  ___\ /\  == \   
\ \ \__ \\ \ \/\ \    \ \  __< \ \ \_\ \\ \ \-.  \\ \ \-.  \\ \  __\ \ \  __<   
 \ \_____\\ \_____\    \ \_\ \_\\ \_____\\ \_\\"\_\\ \_\\"\_\\ \_____\\ \_\ \_\ 
  \/_____/ \/_____/     \/_/ /_/ \/_____/ \/_/ \/_/ \/_/ \/_/ \/_____/ \/_/ /_/ 
```

Docker image for container running Go and waiting for a project to be deployed

## How to use it

Create the docker image:

```bash
$ docker build -t go-runner .
```

Create a new folder in which to put the go project files:

```bash
$ mkdir files
```

Run the docker image by passing the `files` folder as volume to the container workdir `/go/project-files`:

```bash
$ docker run -it -v $PWD/files:/go/project-files --name gr go-runner
```

The container will start and wait for a project to be deployed in the volume folder.

Create a new project:

```bash
$ mkdir my-project

$ cd my-project

$ cat > main.go << 'EOF'
package main
import "fmt"
func main() {
    fmt.Println("hello!")
}
EOF

$ go mod init hello
$ go mod tidy
$ cd ../
```

move the files in the volume folder `files`

```bash
$ ls -a my-project | xargs -I {} mv ./myproject/{} ./files/ 2>/dev/null
```

You'll see the application is recognized and deployed in the container:

```bash
Project uploaded
go: no module dependencies to download
hello!
```

