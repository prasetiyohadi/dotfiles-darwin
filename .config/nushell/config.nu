# config.nu
#
# Installed by:
# version = "0.111.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# Aliases — mirror your ZSH muscle memory
alias k = kubectl
alias tf = terraform
alias d = docker
alias dc = docker compose
alias g = git

# Useful custom commands
def kns [ns: string] {    # switch kube namespace
  kubectl config set-context --current --namespace $ns
}

def pods [] {             # quick running pods table
  kubectl get pods -o json | from json | get items
    | where status.phase == "Running"
    | select metadata.name status.phase
}

def tf-changes [] {       # show terraform plan changes
  terraform show -json | from json | get resource_changes
    | select address change.actions
}

# History settings
$env.config.history.max_size = 10000
$env.config.history.sync_on_enter = true
