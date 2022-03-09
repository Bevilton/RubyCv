import { csfd } from 'node-csfd-api';

csfd.search('bart').then((search) => console.log(search));