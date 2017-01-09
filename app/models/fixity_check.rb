# fixity check modeled in PREMIS RDF
# References:
# 	Archivematica PREMIS events: https://wiki.archivematica.org/PREMIS_metadata:_events#Fixity_check
# 	Carolina Digital Repository PREMIS Events Datastream Example: 		http://blogs.lib.unc.edu/cdr/index.php/about/cdr-development-and-collab/technical-documentation/metadata/premis/premis-events-datastream-example/
# 	Fedora 4 Design: PREMIS event service: https://wiki.duraspace.org/display/FF/Design+-+PREMIS+Event+Service

@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@preifx premis: <http://www.loc.gov/premis/rdf/v1#> .
@prefix local: <http://fedoraInstance:8080/rest/> .
@prefix hydradam2: <http://url/for/hydradam2>

# not sure how this can be connected to an object in Fedora but might need something like following statement:
# <local:Object/BinaryFile> <premis:hasEvent> <local:Object/premis/event1> .
# and inversely
# <local:Object/premis/event1> <premis:hasRelatedObject> <local:Object/BinaryFile> .
# might also work to use hydradam2 URIs for objects and files instead of Fedora 4 URIs

<local:Object/premis/event1> <rdf:type> <premis:Event> ;
    <premis:hasIdentifierType> "UUID" ;
    <premis:hasIdentifierValue> "3521bf8f-6fa2-4b1c-a60d-03f0d59f6268" ;
    <premis:hasEventType> <http://id.loc.gov/vocabulary/preservation/eventType/fix> ;
    <premis:hasEventDateTime> "2016-08-17T13:00:00Z" ;
    <premis:hasEventOutcomeInformation> "SUCCESS|BAD CHECKSUM" ;
    # we discussed wanting the agent to be the user if it was manually initiated
    # all examples are showing agent as some kind of software that runs command:
    # "MD5Deep", "fcrepo4 repository"
    # what we would like to see if automated processes showing agent is something like:
    # <hydradam2:adminUser>
    <premis:hasAgent> <hydradam2:HeidiDowding> .
