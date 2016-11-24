# Inbox Client

Inbox Client is an extendable and flexible email client framework written with cross-platform use in mind.

## Concept

The client is broken up into components that contain connectivity, customization, and display functionality.
A native JavaScript (well, CoffeeScript) framework connects components through a standard API that runs on any
platform, while components might only run on certain platforms, or have different versions customized for specific
platforms.

The framework supports the following categories of components.  Examples of components are listed under each category.
We plan to include these components in official distributions.  In addition, you can create a custom distribution with
any set of components.

Several distributions are planned, including:
- [Electron](http://electron.atom.io/) desktop application
- [Cordova](https://cordova.apache.org/) mobile application
- [Node.js](https://nodejs.org/) server, serving simple HTML pages
- [Node.js](https://nodejs.org/) server, providing a REST API for web, desktop, and mobile applications
- A browser client, that interacts with an Inbox Client server through a REST API (GMail style)
- Local HTML without a server, communicating directly with IMAP (and other) mail servers

Numbers (:one:, :two:) mark the order that component development is planned.

1. **Client Settings**
  contain which components the user wants to use (such as which email sources to use) as well as component settings.
  - :one: **Local Settings**
    use JSON files, LocalStorage, or similar technologies to provide cross-platform settings storage.
    Local settings can override synced settings, to provide device-specific settings.
  - :two: **JSON File Loading**
    provide a simple, manual system to sync settings between devices.  This is planned as a transition stage before
    automatically synced settings are implemented.
  - :three: **Emailed Files**
    would provide a rudimentary automatic syncing solution that requires no additional services.
  - :three: **Syncing Server**
    would provide ideal automatic synchronization.  Servers could either be run by a centralized source, or you could
    run your own server.
  - :four: **Google Drive File**
    would provide a moderately secure, free syncing method.
2. **Email Sources**
  provide messages and a basic folder structure.
  - :one: **[Email.js](http://emailjs.org/)**
    providing an IMAP client in vanilla JavaScript, which can run on almost any client.
  - :three: **Inbox Client client/server**
    to move the burden from browsers onto a more traditional mail client
  - :four: **[Gmail API](https://developers.google.com/gmail/api/)**
    as well as other service-specific APIs, to give stable and lightweight communication.
3. **Metadata Storage**  
  Plugins (discussed later) can store data about each email, such as [Google Inbox](https://www.google.com/inbox/)'s
  "Done", "Snooze", and categorization, or client-only mailboxes.  Data will be locally cached, as well as synced with a
  server.
  - :one: **[NeDB](https://github.com/louischatriot/nedb)**
    provides storage in flat-files (Electron/Node), IndexedDB, WebSQL, or localStorage.
  - :two: (some simple synchronization system, TBD)
  - :three: **[Parse Server](https://parseplatform.github.io/#server)**
    would provide synchronization with a common server system
  - :three: **Google Sheets**
    provides free synchronization, although rather unoptimized.
  - :four: **Inbox Client client/server**
    providing synchronization between 
  - :four: **[MongoDB](https://github.com/mongodb/node-mongodb-native)**
    provides more optimized storage for Electron or Node installations.
4. **Plugins**
  Plugins will provide custom functionality beyond reading and writing emails.  Plugins can store data about each email
  in the Metadata Storage database, and other application-wide data is stored in the Client Settings.
  - :two: **Local Mailboxes/Labels**
    provide system mailboxes that aren't syncronized with the mail server.  The list of mailboxes and sorting rules are
    stored in client settings, and each message is marked with their mailbox/labels in the metadata storage.
  - :three: **Snooze**
    Hide emails that should pop-up at a later date.  Emails are flagged with snooze details in Metadata Storage.
  - :three: **Inbox-Style Categorization**
    Google Inbox provides categories such as "Promotional", "Travel", "Social".  Provide these categories, storing
    sorting rules in the Client Settings, and caching the categories for emails in Metadata Storage.
5. **Client Output**
  Most distributions of Inbox Client will output dynamic HTML content to display the email contents.  A few clients
  might output different HTML pages (MVC style), or provide an API that wraps the above functionality, to allow
  lightweight clients.
  - :one: **[Material Design](http://materializecss.com/)/[Riot.js](http://riotjs.com/) client**
    Think Google Inbox.
  - :four: **Apple Mail Inspired Interface**
    Honestly, I haven't seen an email environment better styled than Apple Mail.
  - :four: **Inbox Client API**
    could provide a centralized storage and plugin runner to power lightweight clients.
    Along the lines of [Nylas N1](https://github.com/nylas/N1).

## Implementation

This repository is for the Inbox Client framework, which ties together different frameworks.

The root of this repository is published on NPM as `@inbox-client/internal`, with the build system for distributions
included.  This is useful for those building distributions, or testing components against the full Inbox Client.

A smaller distribution of this repository is also published on NPM under `inbox-client`, containing just the framework.
This is what Inbox Client distributions should extend.

As the central repository, official distributions are built for testing and deployment out of this repository.
