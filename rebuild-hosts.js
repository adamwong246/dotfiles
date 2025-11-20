const fs = require('fs');
const https = require('https');

async function fetchBlocklist(url) {
    return new Promise((resolve, reject) => {
        https.get(url, (response) => {
            let data = '';
            
            response.on('data', (chunk) => {
                data += chunk;
            });
            
            response.on('end', () => {
                resolve(data);
            });
            
        }).on('error', (error) => {
            reject(error);
        });
    });
}

function processBlocklist(content) {
    const lines = content.split('\n');
    const processedLines = [];
    
    for (let line of lines) {
        // Skip comment lines and empty lines
        if (line.startsWith('#') || line.trim() === '') {
            continue;
        }
        
        // Process domain entries (lines starting with *.domain)
        if (line.startsWith('*.')) {
            const domain = line.substring(2).trim();
            processedLines.push(`0.0.0.0 ${domain}`);
        }
    }
    
    return processedLines;
}

async function rebuildHostsFile(filePath) {
    try {
        // Fetch the blocklist
        console.log('Fetching social blocklist...');
        const blocklistContent = await fetchBlocklist('https://gitlab.com/hagezi/mirror/-/raw/main/dns-blocklists/wildcard/social.txt');
        
        // Process the blocklist
        const processedEntries = processBlocklist(blocklistContent);
        console.log(`Processed ${processedEntries.length} domain entries`);
        
        // Create the new content
        const content = `# This file cannot be adopted via stow- you must copy the file to /etc/hosts

## The standard hosts file
### localhost is used to configure the loopback interface when the system is booting.  Do not change this entry.
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost


## Block social networks
## Source: https://gitlab.com/hagezi/mirror/-/raw/main/dns-blocklists/wildcard/social.txt
## Credits: HaGeZi's Social Networks DNS Blocklist
#
${processedEntries.join('\n')}
`;
        
        // Write the content to the file
        fs.writeFileSync(filePath, content);
        console.log(`Hosts file rebuilt successfully with ${processedEntries.length} blocked domains.`);
        
    } catch (error) {
        console.error('Error rebuilding hosts file:', error.message);
        process.exit(1);
    }
}

// Get command line arguments
const args = process.argv.slice(2);
if (args.length < 1) {
    console.log('Usage: node rebuild-hosts.js <hosts-file>');
    console.log('Example: node rebuild-hosts.js hosts');
    process.exit(1);
}

const hostsFile = args[0];
rebuildHostsFile(hostsFile);
