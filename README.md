# AftrRAD_Container

Summary: Docker container for AftrRADv5.0.0.1.  This version is equivalent to v5.0 with the exception that AftrRAD outputs (/Output, /TempFiles, and all formatted files created with scripts in /Formatting) now go to /out instead of remaining in the main AftrRAD directory.  This is necessary for running as a container. 

Mounting Volumes: Make sure to mount the /Data and /Barcodes directories containing the input files to the folder in the container that contains the AftrRAD.pl script.  Also make sure to mount the /out directory that will be created as part of the run so that the output files are returned.  

Example usage: docker run -it -v /$HOME/AftrRAD_input/Data/:/opt/AftrRADv5.0.0.1/Data -v /$HOME/AftrRAD_input/Barcodes/:/opt/AftrRADv5.0.0.1/Barcodes -v /$HOME/out/:/opt/AftrRADv5.0.0.1/out msovic/aftrrad:5.0.0.1 /bin/bash
