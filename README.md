Add this as your userdata:

    export VERSION=e485fff
    curl -sL -o- https://raw.githubusercontent.com/devopsomatic/aws/${VERSION}/bootstrap.sh | bash -s --

Alternatively, to always use the master (which is generally considered unsafe), just:

    curl -sL -o- https://raw.githubusercontent.com/devopsomatic/aws/master/bootstrap.sh | bash -s --
