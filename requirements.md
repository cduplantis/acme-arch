# Design Challenge

The design challenge is a solution architecture discussion with some guiderails.  It helps for people to see this upfront and get their heads wrapped around the scenario.  We have found a tool like https://cloudcraft.co/ is acceptable, https://www.diagrams.net/ is also zero cost and easy to get started for the architecture diagrams but people have also used all kinds of things they are already used to.  We have found it easier for a lot of people to do some upfront work but we have also done this live with people.  Either is just fine with us.


- Assumptions, Security and performance concerns should be part of the conversation.

Background

ACME CORP. has an existing digital asset called MyACME consisting of a web portal and mobile web app. It’s 2-3 year old, heavily utilized, but is not meeting the needs of the company. A $2 million investment to enhance the asset has been approved. 

Problem/Context

MyACME is large application (registration, login, billing, FNOL, Premium Audit) for the Bond division.  The business wants to eventually expand its usage by rolling it out to their commercial and personal LOBs.  The code utilizes a large shared Oracle database that has been a known bottleneck, infrastructure and technology are aging, and major new features must be added (List below). 

Requirements/Features–

- Add New functionality: move from custom to corporate UX design system

- Add New functionality: intuitive customer experience across ACME lines of business

- Add New functionality: embedded chat channel for communications

- Change functionality:   data persistence options

- Change technical:         currently hosted on-premise with the direction leverage public cloud where effective

- Future technology:       enable feature toggle, a/b testing, blue/green or canary deployments

Objective

Draft an architecture solution for the scenario above.  Describe all relevant aspects as needed. Audience is the ARB(architecture review board) consisting of fellow architects and technology leaders throughout ACME.  This is the initial review with ARB (Architecture Review Board).





