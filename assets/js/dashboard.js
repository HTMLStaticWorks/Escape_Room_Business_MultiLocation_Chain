/* Dashboard Javascript for Escape Room Template */

document.addEventListener("DOMContentLoaded", () => {
    const sidebarToggle = document.getElementById('sidebar-toggle');
    const sidebar = document.getElementById('sidebar');

    if (sidebarToggle && sidebar) {
        sidebarToggle.addEventListener('click', (e) => {
            e.preventDefault();
            sidebar.classList.toggle('d-none');
            // Add custom offcanvas classes if we want a proper sliding sidebar on mobile
            if (window.innerWidth < 992) {
                sidebar.classList.toggle('d-block');
                sidebar.classList.toggle('position-absolute');
                sidebar.style.zIndex = '1000';
            }
        });
    }
});
