import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import 'activestorage';

Rails.start();
Turbolinks.start();

const application = Application.start()
const controllers = require.context('controllers', true, /.js$/);

application.load(definitionsFromContext(controllers));
