include("../AWSServices.jl")
using .AWSServices: qldb_session

"""
    SendCommand()

Sends a command to an Amazon QLDB ledger.

Optional Parameters
{
  "SessionToken": "Specifies the session token for the current command. A session token is constant throughout the life of the session. To obtain a session token, run the StartSession command. This SessionToken is required for every subsequent command that is issued during the current session.",
  "AbortTransaction": "Command to abort the current transaction.",
  "FetchPage": "Command to fetch a page.",
  "CommitTransaction": "Command to commit the specified transaction.",
  "StartSession": "Command to start a new session. A session token is obtained as part of the response.",
  "StartTransaction": "Command to start a new transaction.",
  "EndSession": "Command to end the current session.",
  "ExecuteStatement": "Command to execute a statement in the specified transaction."
}
"""
SendCommand() = qldb_session("SendCommand")
SendCommand(args) = qldb_session("SendCommand", args)