// Entry point for the build script in your package.json
import "./jquery"
import Rails from '@rails/ujs';

Rails.start();

import "jquery-ui-dist/jquery-ui.min"
import "overhang/dist/overhang.min"
import '@client-side-validations/client-side-validations/src'

import "trix"
import "@rails/actiontext"

$(document).ready(function() {
    $("#owner a.add_fields").
    data('association-insertion-method', 'after').
    data('association-insertion-node', 'this');
});