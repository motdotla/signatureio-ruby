# Signatureio Ruby Bindings

This gem is a wrapper for [Signature.io](https://www.signature.io)'s API.

## Installation

Add this line to your application's Gemfile:

    gem 'signatureio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install signatureio

Then in your application initialize the gem:

    $ Signatureio.secret_api_key = "your_secret_api_key"
    $ Signatureio.public_api_key = "your_public_api_key"

Alternatively, you can simply set the environment variables SIGNATURE_SECRET_API_KEY and SIGNATURE_PUBLIC_API_KEY on your machine. The rubygem will read it automatically so that you can skip the initialization.

## Usage

### Create Document

    $ Signatureio::Document.create(:url => "https://www.signature.io/pdfs/sign-below.pdf")

Replace the url with a url of the PDF or Microsoft Word file you choose.

### Retrieve Document

    $ Signatureio::Document.retrieve("id_of_document")

### Retrive Document Pages

```bash
$ Signatureio::Document.pages("id_of_document")
```

### List Documents

    $ Signatureio::Document.all

### List Events

    $ Signatureio::Event.all
    $ Signatureio::Event.all({count: 1, offset: 1, type: "document.created"})

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. export SIGNATURE_SECRET_API_KEY="your_test_secret_api_key"
4. export SIGNATURE_PUBLIC_API_KEY="your_test_public_api_key"
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
