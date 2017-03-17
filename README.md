# Lua Wireshark Dissectors

Lua wireshark dissector scripts provide an easily customized cross platform dissection solution for viewing common binary exchange protocols.

# Use

To dissect packets, place lua script(s) in the wireshark plugins directory.  
The standard path on a standard windows install:

    C:\Program Files\Wireshark\plugins\[version]\

Note: Some packets contain enough information to programmatically determine the correct protocol specification.  Some do not.  If you add multiple dissectors to your plugins folder, wireshark will dissect each "conversation" based on the first matching protocol. 

For more information:

https://wiki.wireshark.org/Lua#How_Lua_fits_into_Wireshark

# Development

These dissector scripts are source generated.  Updates are greatly appreciated; however, source generation requires a slighty different process.  Instead of committing to existing general scripts, the recommended process is to post a copied script with suggested edits and explanation.  If the changes are applicable to some or all protocols, we will update the generator and regenerate.

Note: the existing model is still in beta and subject to rapid development.

Please report any dissection errors to contact.omi at protonmail.  Include a small note on what you expect, a zipped minimal capture demonstrating the problem, and a link or pdf specification documenting the correct behavior. 

# Disclaimer

The Open Markets Initiative (Omi) is a group of technologists dedicated to enhancing the stability of electronic financial markets using modern development methods. Enjoy.
