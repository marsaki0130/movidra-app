import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
 

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

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