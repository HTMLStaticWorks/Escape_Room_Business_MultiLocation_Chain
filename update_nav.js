const fs = require('fs');
const path = require('path');

const rootDir = ".";

const filesToUpdate = [
    'home-2.html',
    'about.html',
    'services.html',
    'service-details.html',
    'pricing.html',
    'blog.html',
    'blog-details.html',
    'contact.html',
    '404.html',
    'coming-soon.html',
    'login.html',
    'register.html'
];

const indexContent = fs.readFileSync('index.html', 'utf8');

// Extract Header + Mobile Menu from index.html
const startHeaderMarker = '<!-- Header -->';
const endMenuMarker = '<!-- Mobile Offcanvas Menu -->';

const headerStartIndex = indexContent.indexOf(startHeaderMarker);
const mainTagIndex = indexContent.indexOf('<main>');

if (headerStartIndex === -1 || mainTagIndex === -1) {
    console.error("Could not find header or main tags in index.html");
    process.exit(1);
}

// The complete header block
const fullHeaderBlock = indexContent.substring(headerStartIndex, mainTagIndex);

filesToUpdate.forEach(file => {
    const filePath = path.join(rootDir, file);
    if (fs.existsSync(filePath)) {
        let content = fs.readFileSync(filePath, 'utf8');
        
        // Find existing header to replace
        const existingHeaderStart = content.indexOf('<header');
        const existingHeaderEnd = content.indexOf('</header>') + 9;
        
        if (existingHeaderStart !== -1 && existingHeaderEnd !== -1) {
            // Replace existing <header> with the fullHeaderBlock
            const newContent = content.substring(0, existingHeaderStart) + fullHeaderBlock + content.substring(existingHeaderEnd);
            fs.writeFileSync(filePath, newContent, 'utf8');
            console.log(`Updated ${file}`);
        } else if (file === '404.html' || file === 'coming-soon.html' || file === 'login.html' || file === 'register.html') {
            // These files might not have a <header> tag, insert after <body>
            const bodyStart = content.indexOf('<body>');
            const bodyStyleStart = content.indexOf('<body ');
            let targetIndex = -1;
            
            if (bodyStyleStart !== -1) {
                targetIndex = content.indexOf('>', bodyStyleStart) + 1;
            } else if (bodyStart !== -1) {
                targetIndex = bodyStart + 6;
            }
            
            if (targetIndex !== -1) {
                const newContent = content.substring(0, targetIndex) + "\n" + fullHeaderBlock + "\n" + content.substring(targetIndex);
                fs.writeFileSync(filePath, newContent, 'utf8');
                console.log(`Added header to ${file}`);
            }
        }
    }
});
