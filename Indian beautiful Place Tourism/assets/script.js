document.addEventListener('DOMContentLoaded', () => {
    // Hamburger menu functionality
    const hamburger = document.querySelector('.hamburger');
    const navLinks = document.querySelector('.nav-links');

    hamburger.addEventListener('click', () => {
        navLinks.classList.toggle('active');
    });

    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
                // Close mobile menu if open
                navLinks.classList.remove('active');
            }
        });
    });

    // Book button click handler
    const bookButtons = document.querySelectorAll('.book-button');
    bookButtons.forEach(button => {
        button.addEventListener('click', () => {
            alert('Booking system coming soon!');
        });
    });

    // Scroll reveal animation
    window.addEventListener('scroll', () => {
        const reveals = document.querySelectorAll('.destination-card, .package-card');
        
        reveals.forEach(element => {
            const windowHeight = window.innerHeight;
            const elementTop = element.getBoundingClientRect().top;
            const elementVisible = 150;

            if (elementTop < windowHeight - elementVisible) {
                element.classList.add('active');
            }
        });
    });
});

//booking section
function validateForm() {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const date = document.getElementById('date').value;
    
    // Validate name (at least 3 characters)
    if (name.length < 3) {
        alert('Please enter a valid name (minimum 3 characters)');
        return false;
    }

    // Validate email format
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        alert('Please enter a valid email address');
        return false;
    }

    // Validate phone number (10 digits)
    const phonePattern = /^\d{10}$/;
    if (!phonePattern.test(phone)) {
        alert('Please enter a valid 10-digit phone number');
        return false;
    }

    // Validate date (must be in the future)
    const selectedDate = new Date(date);
    const today = new Date();
    if (selectedDate < today) {
        alert('Please select a future date');
        return false;
    }

    // If all validations pass
    alert('Booking submitted successfully!');
    return true;
}

// Set minimum date to today
window.onload = function() {
    const dateInput = document.getElementById('date');
    const today = new Date().toISOString().split('T')[0];
    dateInput.min = today;
};