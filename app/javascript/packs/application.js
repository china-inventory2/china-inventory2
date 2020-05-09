//JSファイルの読み込み設定
import '../javascripts/application';
//CSSファイルの読み込み設定
import '../stylesheets/application';

import 'bootstrap'
import '@fortawesome/fontawesome-free/js/all'
import '../stylesheets/application.scss'
import Rails from 'rails-ujs'

//Imageファイルの読み込み設定
require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);
console.log('Hello World from Webpacker');

Rails.start()