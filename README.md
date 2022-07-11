# Codesec Goat

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

A security testbed, vulnerable by design for testing codesec pipeline solutions. 

_Why "goat"?_
> A common saying is that if your fence won't hold water, it won't hold a goat. Animals are very creative, and will find a way around your barriers. In the same funny analogy, a _goat repo_ demonstrates creativity and deliberate security issues that you might not expect.

## Repo Breakdown 
Includes a combination of:

* Secrets, access control, hardcoding across many providers and systems
* 3rd party services
* 3rd party vendors + misconfiguration
* Non programming language assets
* Out of band assets (such as binary data)
* By-design overhead (large projects)
* Developer workflows: CI, pre-commit
* Extensibility and customizations

Designed to test and showcase:

* Coverage and value for sensitive, high risk, access control data
* High cloud services scenarios
* High open source usage integration scenarios
* Code security as a whole (full asset scan)
* Speed and efficiency of complex scans
* Ease of integration and developer experience