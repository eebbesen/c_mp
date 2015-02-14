# c_mp
## What
This is a sample project for automating citizen water monitoring by the MPCA.  This is not in any way authorized or approved by the MPCA.

## Why
The MPCA currently collects lake and stream monitoring data via spreadsheets.  It is hoped that allowing citizen volunteers to submit data directly to a datastore via personal computer or mobile device will save time and reduce errors.

# How

## Creating administrators
c_mp requires administrators to be created via the Rails console.  For example:
`Admin.create!(email: 'admin@mpca.gov', password: 'Password1')`
