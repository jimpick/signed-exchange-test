console.log('Hello from sw.js');

importScripts('https://storage.googleapis.com/workbox-cdn/releases/3.6.1/workbox-sw.js');

if (workbox) {
  console.log(`Yay! Workbox is loaded 🎉`);
} else {
  console.log(`Boo! Workbox didn't load 😬`);
}

workbox.routing.registerRoute(
  ({url}) => url !== '/sw.js',
  handler
);

const ipns = 'QmZWWM9nz5HTqdVuURN1YGskfc3vv24BSoQnwc3QYcmy82'
const baseUrl = `https://ipfs.io/ipns/${ipns}`

function handler ({url, event}) {
  let {pathname} = url
  if (pathname === '/') pathname = '/index.html'
  const redirectUrl = `${baseUrl}${pathname}.sxg`
  return Response.redirect(redirectUrl)
}
