## Lua Wireshark Dissectors

Lua wireshark dissector scripts provide an easily customized cross platform dissection solution for viewing common binary exchange protocols. For more information: [How Lua fits into Wireshark](https://wiki.wireshark.org/Lua#How_Lua_fits_into_Wireshark "How Lua fits into Wireshark")

## Usage

To dissect packets, place lua script(s) in the wireshark plugins directory.

The standard path on a windows install:

    C:\Program Files\Wireshark\plugins\[version]\

The standard path on a linux install:

    //usr/share/wireshark/plugins

Note: Some packets contain enough information to programmatically determine the correct protocol specification.  Some do not.  If you add multiple dissectors to your plugins folder, wireshark will dissect each "conversation" based on the first matching protocol.

https://www.wireshark.org/docs/wsug_html_chunked/ChAppFilesConfigurationSection.html

## Protocols

|Organization | Protocol | Data | Version|
|--- | --- | --- | ---|
|Eurex | T7 | Eobi | 2.5.5|
|Asx | Itch | Mdp | 2.4.0|
|Ice | iMpact | Mdp | 1.24.0|
|Cme | Sbe | Mdp | 5.1.0|
|Cme | Sbe | Mdp | 6.1.0|
|Cme | Sbe | Mdp | 8.1.0|
|Miax | Mach | Tom | 1.9.0|
|Miax | Mach | cTom | 1.1.0|

## Development

This repository is source generated.  Everything from the lua dissectors to the words you are reading right now.  Updates are greatly appreciated; however, source generation requires a slighty different workflow.  The recommended process is to post a copied script with suggested edits and explanation.  If the changes are applicable to some or all protocols, we will update the model and regenerate.

Note: The existing model is still in beta and subject to rapid development.

Please report any dissection errors as issues.  Include a small note on the protocol and version, what you expect, a zipped minimal capture demonstrating the problem, and a link or pdf specification documenting the correct behavior. 

## Disclaimer

The Open Markets Initiative (Omi) is a group of technologists dedicated to enhancing the stability of electronic financial markets using modern development methods. Any similaraity between existing people, places and/or protocols is purely incidental. Enjoy.

