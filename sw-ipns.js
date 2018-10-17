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

const ipns = 'QmXX8CERLYAzetnmATjxh7pQUZAaVbAWtb9vsCqmn5b7Fi'
const baseUrl = `https://ipfs.jimpick.com/ipns/${ipns}`

function handler ({url, event}) {
  let {pathname} = url
  if (pathname === '/') pathname = '/index.html'
  const redirectUrl = `${baseUrl}${pathname}.sxg`
  return Response.redirect(redirectUrl)
}
