import '../javascripts/application';
import '../stylesheets/application';

require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);

console.log('Hello World from Webpacker');

import 'bootstrap'
import '@fortawesome/fontawesome-free/js/all'
import '../stylesheets/application.scss'