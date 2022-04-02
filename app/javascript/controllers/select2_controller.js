import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import Select2 from "select2"

export default class extends Controller {
    connect() {
        Select2()
        $(".tags").select2({
            tags: true,
            language: "ar",
            dir: "rtl",
            placeholder: "اكتب الوسم المطلوب ثم اضغط enter",
        })
    }
}
