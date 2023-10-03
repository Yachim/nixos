from json import loads, dumps
from subprocess import check_output, run
from sys import argv

minimum = int(argv[1])

workspaces = {}
for client in loads(check_output(["hyprctl", "clients", "-j"])):
    workspace = client["workspace"]
    if workspace["id"] < minimum: continue

    workspace_id = workspace["id"]

    if workspace_id not in workspaces:
        workspaces[workspace_id] = {
            "title": [client["initialTitle"]],
            "windows_cnt": 1
        }
    else:
        workspaces[workspace_id]["title"].append(client["initialTitle"])
        workspaces[workspace_id]["windows_cnt"] += 1

workspaces_list = [{
    "id": key,
    "title": ", ".join(list(dict.fromkeys(value["title"]))),
    "windows_cnt": value["windows_cnt"]
} for key, value in workspaces.items()]
workspaces_list.sort(key=lambda x: x["id"])

if len(workspaces_list) == 0: 
    print("empty")
    run(["eww", "update", "extra-workspaces-open=false"])
else: print(dumps(workspaces_list))
