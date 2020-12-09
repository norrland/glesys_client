defmodule ServerTest do
  use ExUnit.Case
  doctest GlesysClient.Server

  alias GlesysClient.Server
    #server = ~s([{"serverid":"wps1234567","hostname":"myvmwarehost",
    #  "description":"","cpucores":2,"memorysize":512,"disksize":10,
    #  "bandwidth":10,"templatename":"None","datacenter":"Falkenberg",
    #  "managedhosting":"no","projectkey":"cl12345","transfer":6400,
    #  "supportedfeatures":{"status":"yes","start":"yes","reboot":"yes",
    #    "stopsoft":"yes","stophard":"yes","destroy":"yes","consolehtml":"yes",
    #    "consolevnc":"no","clone":"yes","resourceusage":"yes","editdisksize":"yes",
    #    "editmemorysize":"yes","editcpucores":"yes","edittransfer":"yes",
    #    "editbandwidth":"yes","editip":"yes","beancounterslimit":"no",
    #    "resetrootpassword":"no","uptime":"yes","iso":"yes","changebandwidth":"yes",
    #    "activatebackup":"yes","bios":"yes"},
    #  "gleraenabled":"no","platform":"VMware","isofile":null,
    #  "cost":{"amount":146.7,"currency":"SEK","timeperiod":"month"},
    #  "backup":{"type":null,"enabled":"no","size":null},
    #  "iplist":[
    #    {"ipaddress":"10.0.0.1","version":4,"lockedtoaccount":false,"cost":20,"currency":"SEK"},
    #    {"ipaddress":"2a02:750:a::1","version":6,"lockedtoaccount":false,"cost":1,"currency":"SEK"}
    #  ],
    #    "state":null,"billing":{"currency":"SEK","price":146.7,"discount":0,"total":146.7}}])

  # funky parseing of servers json data.
  test "parse Server" do
    server = Jason.decode!(~s([{"serverid":"wps1234567"}]))
    testserver = Server.map_servers(server)
    assert hd(testserver).serverid == "wps1234567"
  end
end
