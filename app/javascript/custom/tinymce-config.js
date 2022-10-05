tinymce.init({
    selector: '.tinymce',
    height: 500,
    menubar: false,
    plugins: [
        'insertdatetime lists media table code help wordcount'
    ],
    toolbar: 'undo redo | blocks | bold italic underline strikethrough|' +
        ' alignleft aligncenter alignright | bullist numlist outdent indent' +
        ' |lineheight|media |removeformat | blockquote'
});