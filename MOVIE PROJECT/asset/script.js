// Movie data
const movies = [
    {
        id: 1,
        title: "Inception",
        director: "Christopher Nolan",
        duration: "2h 28min",
        genre: "Sci-Fi, Action",
        rating: "PG-13",
        image: "inception.jpg",
        description: "A thief who steals corporate secrets through dream-sharing technology is given the task of planting an idea into the mind of a C.E.O.",
        showtimes: ["10:00 AM", "2:00 PM", "6:00 PM", "9:00 PM"]
    },
    // Add more movies here
];

// Slider functionality
let currentSlide = 0;
const sliderContainer = document.querySelector('.hero-slider');
const prevBtn = document.querySelector('.prev-btn');
const nextBtn = document.querySelector('.next-btn');

function initializeSlider() {
    movies.forEach((movie, index) => {
        const slide = document.createElement('div');
        slide.className = `slider-slide ${index === 0 ? 'active' : ''}`;
        slide.innerHTML = `
            <img src="${movie.image}" alt="${movie.title}">
            <div class="slide-content">
                <h2>${movie.title}</h2>
                <p>${movie.description}</p>
            </div>
        `;
        sliderContainer.appendChild(slide);
    });
}

function changeSlide(direction) {
    const slides = document.querySelectorAll('.slider-slide');
    slides[currentSlide].classList.remove('active');
    
    if (direction === 'next') {
        currentSlide = (currentSlide + 1) % slides.length;
    } else {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    }
    
    slides[currentSlide].classList.add('active');
}

prevBtn.addEventListener('click', () => changeSlide('prev'));
nextBtn.addEventListener('click', () => changeSlide('next'));

// Movie grid functionality
function displayMovies(movieList = movies) {
    const movieGrid = document.querySelector('.movie-grid');
    movieGrid.innerHTML = movieList.map(movie => `
        <div class="movie-card" onclick="openMovieModal(${movie.id})">
            <img src="${movie.image}" alt="${movie.title}">
            <div class="movie-info">
                <h3>${movie.title}</h3>
                <p>${movie.genre}</p>
            </div>
        </div>
    `).join('');
}

// Search functionality
const searchInput = document.getElementById('searchInput');
searchInput.addEventListener('input', (e) => {
    const searchTerm = e.target.value.toLowerCase();
    const filteredMovies = movies.filter(movie => 
        movie.title.toLowerCase().includes(searchTerm) ||
        movie.genre.toLowerCase().includes(searchTerm)
    );
    displayMovies(filteredMovies);
});

// Movie modal functionality
const modal = document.getElementById('movieModal');
const closeBtn = document.querySelector('.close');

function openMovieModal(movieId) {
    const movie = movies.find(m => m.id === movieId);
    const modalContent = document.querySelector('.movie-details');
    
    modalContent.innerHTML = `
        <img src="${movie.image}" alt="${movie.title}">
        <h2>${movie.title}</h2>
        <p><strong>Director:</strong> ${movie.director}</p>
        <p><strong>Duration:</strong> ${movie.duration}</p>
        <p><strong>Genre:</strong> ${movie.genre}</p>
        <p><strong>Rating:</strong> ${movie.rating}</p>
        <p>${movie.description}</p>
        <div class="showtimes">
            <h3>Showtimes</h3>
            <div class="showtime-buttons">
                ${movie.showtimes.map(time => `
                    <button onclick="bookTicket('${movie.title}', '${time}')">${time}</button>
                `).join('')}
            </div>
        </div>
    `;
    
    modal.style.display = 'block';
}

closeBtn.onclick = function() {
    modal.style.display = 'none';
}

window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
}

// Schedule functionality
function initializeSchedule() {
    const dateSelector = document.querySelector('.date-selector');
    const dates = getNextWeekDates();
    
    dateSelector.innerHTML = dates.map((date, index) => `
        <button class="date-button ${index === 0 ? 'active' : ''}" 
                onclick="updateSchedule('${date}')">${date}</button>
    `).join('');
}

function getNextWeekDates() {
    const dates = [];
    const today = new Date();
    
    for (let i = 0; i < 7; i++) {
        const date = new Date(today);
        date.setDate(today.getDate() + i);
        dates.push(date.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' }));
    }
    
    return dates;
}

function updateSchedule(date) {
    const dateButtons = document.querySelectorAll('.date-button');
    dateButtons.forEach(button => {
        button.classList.remove('active');
        if (button.textContent === date) {
            button.classList.add('active');
        }
    });
    
    // Update schedule grid with movies for selected date
    // This would typically fetch data from a backend
}

// Booking functionality
function bookTicket(movieTitle, showtime) {
    // This would typically open a booking form or redirect to a booking page
    alert(`Booking ticket for ${movieTitle} at ${showtime}`);
}

// Initialize the page
document.addEventListener('DOMContentLoaded', () => {
    initializeSlider();
    displayMovies();
    initializeSchedule();
    
    // Auto-advance slider every 5 seconds
    setInterval(() => changeSlide('next'), 5000);
});