TITLE
Confocal Image Analysis for Protein Aggregates, GFAP, and IBA1

DESCRIPTION
This code was designed for the analysis of cells and aggregates in confocal microscopy images.  It was designed for a single experiment, the analysis of immunofluorescence images taken of murine motor cortex.  Methods for these experiments will be found at the following location (to be added upon publication).  This program functions well for the analysis of dipeptide repeat aggregates, GFAP (astrocytes), and IBA1 (microglia), but could easily be used to analyze any similar staining.

INSTALLATION
This program requires MATLAB 2018a or later with the Image Processing Toolbox installed.

USAGE
Images used must be three-channel RGB and separated into folders based upon treatment.  This code is represented as used in our paper (publication name and link will be added here) and is not optimized for general purpose use.  As there is no graphical interface, users must adjust the filepaths, save file names, and parameters manually.  Instructions for adjusting the parameters are included in the comments of the first block of code.  Parameters (cluster size, etc) must be adjusted based on the natural noise present in immunofluorescence images, and should be kept within the defined ranges for mathematical relevance.

CONTRIBUTING AND CREDITS
The primary contributor to this block of code is Kitty Savage.  Individuals with significant contributions to the experimental design and execution include (but are not limited to) Ricardos Tabet, Ananya Ray-Soni, Corey Aguilar, Nibha Mishra, Fernande Freyermuth, Chao-Zong Lee, and Clotilde Lagier-Tourenne.  The mouse line used for this experiment was developed by the lab of Leonard Petrucelli.  A complete list of contributers and their affiliations can be found in our upcoming publication.

http://www.lagiertourennelab.com/
