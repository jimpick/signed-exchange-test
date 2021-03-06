console.log('Hello from sw.js');

importScripts('https://storage.googleapis.com/workbox-cdn/releases/3.6.1/workbox-sw.js');

if (workbox) {
  console.log(`Yay! Workbox is loaded 🎉`);
} else {
  console.log(`Boo! Workbox didn't load 😬`);
}

let baseUrl

workbox.routing.registerRoute(
  ({url}) => url !== '/sw.js' && url !== '/ipfs-hash.txt',
  handler
);

function handler ({url, event}) {
  if (!baseUrl || fetchTime < Date.now() - 1000) {
    return fetch('/ipfs-hash.txt')
      .then(res => res.text())
      .then(ipfsHash => {
        if (!ipfsHash) return
        fetchTime = Date.now()
        baseUrl = `https://ipfs.jimpick.com/ipfs/${ipfsHash}`
        console.log('Loading from IPFS:', baseUrl)
        return respond()
      })
      .catch(err => {
        console.error(err)
      })
  } else {
    return respond()
  }

  function respond () {
    let {pathname} = url
    if (pathname === '/') pathname = '/index.html'
    const redirectUrl = `${baseUrl}${pathname}.sxg`
    return Response.redirect(redirectUrl)
  }
}

