from json import loads
from subprocess import check_output

data = loads(check_output(["hyprctl", "monitors", "-j"]))[0]
active_workspace = data["activeWorkspace"]["id"]

print(active_workspace)
