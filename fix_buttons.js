const fs = require('fs');
const path = require('path');

function walk(dir) {
    fs.readdirSync(dir).forEach(file => {
        const fullPath = path.join(dir, file);
        if (fs.statSync(fullPath).isDirectory()) {
            walk(fullPath);
        } else if (fullPath.endsWith('.html')) {
            let content = fs.readFileSync(fullPath, 'utf8');
            
            // Replace RTL desktop button
            const rtlTarget = 'class="btn btn-link text-decoration-none fw-bold p-0 me-1" style="color: var(--text-color); font-size: 0.95rem;"';
            const rtlReplacement = 'class="btn-navbar-icon"';
            
            // Replace Theme toggle button
            const themeTarget = 'class="btn btn-link p-0 text-decoration-none" style="color: var(--text-color);"';
            const themeReplacement = 'class="btn-navbar-icon"';

            // dashboard has a slightly different one:
            const dashboardRtlTarget = 'class="btn btn-link text-decoration-none me-3 fw-bold" style="color: var(--text-color); font-size: 0.95rem;"';
            const dashboardThemeTarget = 'class="btn btn-link text-decoration-none me-3" style="color: var(--text-color);"';
            
            let updated = false;
            
            if (content.includes(rtlTarget)) {
                content = content.split(rtlTarget).join(rtlReplacement);
                updated = true;
            }
            if (content.includes(themeTarget)) {
                content = content.split(themeTarget).join(themeReplacement);
                updated = true;
            }
            if (content.includes(dashboardRtlTarget)) {
                content = content.split(dashboardRtlTarget).join(rtlReplacement + ' me-2');
                updated = true;
            }
            if (content.includes(dashboardThemeTarget)) {
                content = content.split(dashboardThemeTarget).join(themeReplacement + ' me-2');
                updated = true;
            }
            
            if (updated) {
                fs.writeFileSync(fullPath, content);
                console.log(`Updated ${fullPath}`);
            }
        }
    });
}
walk('.');
