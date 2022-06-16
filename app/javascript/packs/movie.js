import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
 

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
axios.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

componentDidMount() {
    this.getMovieList()
  }

  getMovieList(){
    axios.get('https://api.themoviedb.org/3/movie/550?api_key=424e68afea1c77a991f3c55e8a7d01b0')
    .then(response => {
      console.log(response.data)
    }).catch(err => {
      console.log('err:', err);
    });
  }

const handleHeartDisplay = (hasLiked) => {
    if (hasLiked){
        $('.active-heart').removeClass('hidden')
    } else {
        $('.inactive-heart').removeClass('hidden')
    }
} 

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#movie-show').data()
  const movieId = dataset.movieId

 

  axios.get(`/movies/${movieId}/like`)
    .then((response) => {
        const hasLiked = response.data.hasLiked
        handleHeartDisplay(hasLiked)
    })

    $('.inactive-heart').on('click', () => {
        axios.post(`/movies/${movieId}/like`)
          .then((response) => {
              if (response.data.status === 'ok') {
                $('.active-heart').removeClass('hidden')
                $('.inactive-heart').addClass('hidden')
              }
          })
          .catch((e) => {
              window.alert('Error')
              console.log(e)
          })
    })

    $('.active-heart').on('click', () => {
        axios.delete(`/movies/${movieId}/like`)
          .then((response) => {
            if (response.data.status === 'ok') {
                $('.active-heart').addClass('hidden')
                $('.inactive-heart').removeClass('hidden')
              }
          })
          .catch((e) => {
              window.alert('Error')
              console.log(e)
          })
    })
})