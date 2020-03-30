include("../AWSServices.jl")
using .AWSServices: managedblockchain

"""
    UpdateMember()

Updates a member configuration with new parameters.

Required Parameters
{
  "MemberId": "The unique ID of the member.",
  "NetworkId": "The unique ID of the Managed Blockchain network to which the member belongs."
}

Optional Parameters
{
  "LogPublishingConfiguration": "Configuration properties for publishing to Amazon CloudWatch Logs."
}
"""
UpdateMember(args) = managedblockchain("PATCH", "/networks/{networkId}/members/{memberId}", args)

"""
    GetNetwork()

Returns detailed information about a network.

Required Parameters
{
  "NetworkId": "The unique identifier of the network to get information about."
}
"""
GetNetwork(args) = managedblockchain("GET", "/networks/{networkId}", args)

"""
    CreateNetwork()

Creates a new blockchain network using Amazon Managed Blockchain.

Required Parameters
{
  "VotingPolicy": " The voting rules used by the network to determine if a proposal is approved. ",
  "ClientRequestToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency of the operation. An idempotent operation completes no more than one time. This identifier is required only if you make a service request directly using an HTTP client. It is generated automatically if you use an AWS SDK or the AWS CLI.",
  "MemberConfiguration": "Configuration properties for the first member within the network.",
  "Framework": "The blockchain framework that the network uses.",
  "FrameworkVersion": "The version of the blockchain framework that the network uses.",
  "Name": "The name of the network."
}

Optional Parameters
{
  "FrameworkConfiguration": " Configuration properties of the blockchain framework relevant to the network configuration. ",
  "Description": "An optional description for the network."
}
"""
CreateNetwork(args) = managedblockchain("POST", "/networks", args)

"""
    GetNode()

Returns detailed information about a peer node.

Required Parameters
{
  "MemberId": "The unique identifier of the member that owns the node.",
  "NetworkId": "The unique identifier of the network to which the node belongs.",
  "NodeId": "The unique identifier of the node."
}
"""
GetNode(args) = managedblockchain("GET", "/networks/{networkId}/members/{memberId}/nodes/{nodeId}", args)

"""
    ListProposals()

Returns a listing of proposals for the network.

Required Parameters
{
  "NetworkId": " The unique identifier of the network. "
}

Optional Parameters
{
  "MaxResults": " The maximum number of proposals to return. ",
  "NextToken": " The pagination token that indicates the next set of results to retrieve. "
}
"""
ListProposals(args) = managedblockchain("GET", "/networks/{networkId}/proposals", args)

"""
    RejectInvitation()

Rejects an invitation to join a network. This action can be called by a principal in an AWS account that has received an invitation to create a member and join a network.

Required Parameters
{
  "InvitationId": "The unique identifier of the invitation to reject."
}
"""
RejectInvitation(args) = managedblockchain("DELETE", "/invitations/{invitationId}", args)

"""
    ListInvitations()

Returns a listing of all invitations made on the specified network.

Optional Parameters
{
  "MaxResults": "The maximum number of invitations to return.",
  "NextToken": "The pagination token that indicates the next set of results to retrieve."
}
"""
ListInvitations() = managedblockchain("GET", "/invitations")
ListInvitations(args) = managedblockchain("GET", "/invitations", args)

"""
    ListNodes()

Returns information about the nodes within a network.

Required Parameters
{
  "MemberId": "The unique identifier of the member who owns the nodes to list.",
  "NetworkId": "The unique identifier of the network for which to list nodes."
}

Optional Parameters
{
  "MaxResults": "The maximum number of nodes to list.",
  "NextToken": "The pagination token that indicates the next set of results to retrieve.",
  "Status": "An optional status specifier. If provided, only nodes currently in this status are listed."
}
"""
ListNodes(args) = managedblockchain("GET", "/networks/{networkId}/members/{memberId}/nodes", args)

"""
    GetMember()

Returns detailed information about a member.

Required Parameters
{
  "MemberId": "The unique identifier of the member.",
  "NetworkId": "The unique identifier of the network to which the member belongs."
}
"""
GetMember(args) = managedblockchain("GET", "/networks/{networkId}/members/{memberId}", args)

"""
    CreateMember()

Creates a member within a Managed Blockchain network.

Required Parameters
{
  "NetworkId": "The unique identifier of the network in which the member is created.",
  "ClientRequestToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency of the operation. An idempotent operation completes no more than one time. This identifier is required only if you make a service request directly using an HTTP client. It is generated automatically if you use an AWS SDK or the AWS CLI.",
  "MemberConfiguration": "Member configuration parameters.",
  "InvitationId": "The unique identifier of the invitation that is sent to the member to join the network."
}
"""
CreateMember(args) = managedblockchain("POST", "/networks/{networkId}/members", args)

"""
    ListProposalVotes()

Returns the listing of votes for a specified proposal, including the value of each vote and the unique identifier of the member that cast the vote.

Required Parameters
{
  "NetworkId": " The unique identifier of the network. ",
  "ProposalId": " The unique identifier of the proposal. "
}

Optional Parameters
{
  "MaxResults": " The maximum number of votes to return. ",
  "NextToken": " The pagination token that indicates the next set of results to retrieve. "
}
"""
ListProposalVotes(args) = managedblockchain("GET", "/networks/{networkId}/proposals/{proposalId}/votes", args)

"""
    ListMembers()

Returns a listing of the members in a network and properties of their configurations.

Required Parameters
{
  "NetworkId": "The unique identifier of the network for which to list members."
}

Optional Parameters
{
  "MaxResults": "The maximum number of members to return in the request.",
  "NextToken": "The pagination token that indicates the next set of results to retrieve.",
  "Status": "An optional status specifier. If provided, only members currently in this status are listed.",
  "Name": "The optional name of the member to list.",
  "IsOwned": "An optional Boolean value. If provided, the request is limited either to members that the current AWS account owns (true) or that other AWS accounts own (false). If omitted, all members are listed."
}
"""
ListMembers(args) = managedblockchain("GET", "/networks/{networkId}/members", args)

"""
    CreateNode()

Creates a peer node in a member.

Required Parameters
{
  "MemberId": "The unique identifier of the member that owns this node.",
  "NetworkId": "The unique identifier of the network in which this node runs.",
  "ClientRequestToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency of the operation. An idempotent operation completes no more than one time. This identifier is required only if you make a service request directly using an HTTP client. It is generated automatically if you use an AWS SDK or the AWS CLI.",
  "NodeConfiguration": "The properties of a node configuration."
}
"""
CreateNode(args) = managedblockchain("POST", "/networks/{networkId}/members/{memberId}/nodes", args)

"""
    DeleteNode()

Deletes a peer node from a member that your AWS account owns. All data on the node is lost and cannot be recovered.

Required Parameters
{
  "MemberId": "The unique identifier of the member that owns this node.",
  "NetworkId": "The unique identifier of the network that the node belongs to.",
  "NodeId": "The unique identifier of the node."
}
"""
DeleteNode(args) = managedblockchain("DELETE", "/networks/{networkId}/members/{memberId}/nodes/{nodeId}", args)

"""
    UpdateNode()

Updates a node configuration with new parameters.

Required Parameters
{
  "MemberId": "The unique ID of the member that owns the node.",
  "NetworkId": "The unique ID of the Managed Blockchain network to which the node belongs.",
  "NodeId": "The unique ID of the node."
}

Optional Parameters
{
  "LogPublishingConfiguration": "Configuration properties for publishing to Amazon CloudWatch Logs."
}
"""
UpdateNode(args) = managedblockchain("PATCH", "/networks/{networkId}/members/{memberId}/nodes/{nodeId}", args)

"""
    GetProposal()

Returns detailed information about a proposal.

Required Parameters
{
  "NetworkId": "The unique identifier of the network for which the proposal is made.",
  "ProposalId": "The unique identifier of the proposal."
}
"""
GetProposal(args) = managedblockchain("GET", "/networks/{networkId}/proposals/{proposalId}", args)

"""
    ListNetworks()

Returns information about the networks in which the current AWS account has members.

Optional Parameters
{
  "MaxResults": "The maximum number of networks to list.",
  "NextToken": "The pagination token that indicates the next set of results to retrieve.",
  "Status": "An optional status specifier. If provided, only networks currently in this status are listed.",
  "Framework": "An optional framework specifier. If provided, only networks of this framework type are listed.",
  "Name": "The name of the network."
}
"""
ListNetworks() = managedblockchain("GET", "/networks")
ListNetworks(args) = managedblockchain("GET", "/networks", args)

"""
    CreateProposal()

Creates a proposal for a change to the network that other members of the network can vote on, for example, a proposal to add a new member to the network. Any member can create a proposal.

Required Parameters
{
  "MemberId": "The unique identifier of the member that is creating the proposal. This identifier is especially useful for identifying the member making the proposal when multiple members exist in a single AWS account.",
  "NetworkId": " The unique identifier of the network for which the proposal is made.",
  "Actions": "The type of actions proposed, such as inviting a member or removing a member. The types of Actions in a proposal are mutually exclusive. For example, a proposal with Invitations actions cannot also contain Removals actions.",
  "ClientRequestToken": "A unique, case-sensitive identifier that you provide to ensure the idempotency of the operation. An idempotent operation completes no more than one time. This identifier is required only if you make a service request directly using an HTTP client. It is generated automatically if you use an AWS SDK or the AWS CLI."
}

Optional Parameters
{
  "Description": "A description for the proposal that is visible to voting members, for example, \"Proposal to add Example Corp. as member.\""
}
"""
CreateProposal(args) = managedblockchain("POST", "/networks/{networkId}/proposals", args)

"""
    DeleteMember()

Deletes a member. Deleting a member removes the member and all associated resources from the network. DeleteMember can only be called for a specified MemberId if the principal performing the action is associated with the AWS account that owns the member. In all other cases, the DeleteMember action is carried out as the result of an approved proposal to remove a member. If MemberId is the last member in a network specified by the last AWS account, the network is deleted also.

Required Parameters
{
  "MemberId": "The unique identifier of the member to remove.",
  "NetworkId": "The unique identifier of the network from which the member is removed."
}
"""
DeleteMember(args) = managedblockchain("DELETE", "/networks/{networkId}/members/{memberId}", args)

"""
    VoteOnProposal()

Casts a vote for a specified ProposalId on behalf of a member. The member to vote as, specified by VoterMemberId, must be in the same AWS account as the principal that calls the action.

Required Parameters
{
  "VoterMemberId": "The unique identifier of the member casting the vote. ",
  "NetworkId": " The unique identifier of the network. ",
  "Vote": " The value of the vote. ",
  "ProposalId": " The unique identifier of the proposal. "
}
"""
VoteOnProposal(args) = managedblockchain("POST", "/networks/{networkId}/proposals/{proposalId}/votes", args)
