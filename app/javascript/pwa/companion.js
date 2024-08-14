if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/service-worker.js')
    .then((registration) => {})
    .catch((error) => {
      console.log('Service Worker registration failed:', error);
    });
}
