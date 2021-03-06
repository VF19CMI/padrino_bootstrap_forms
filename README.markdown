Padrino Bootstrap Forms
===============

[![Build Status](https://secure.travis-ci.org/sshaw/padrino_bootstrap_forms.svg?branch=master)](http://travis-ci.org/sshaw/padrino_bootstrap_forms)

Padrino Bootstrap Forms is a port of [Seth Vargo's Bootstrap Forms for Rails](http://github.com/sethvargo/bootstrap_forms). Thanks Seth!

It currently renders forms using Bootstrap 2 markup.

Padrio Version
------------------------
If your Padrino version is < 0.11 you must use version 0.0.2 of this gem.


Differences Between This & The Rails Version
------------------------

* No `bootstrap` namespace for localization
* `@builder.error_messages` was removed and the Padrino version is not automatically called when there's an error
* Models with required attributes will not have the HTML5 `required` attribute automatically added to their `input`s
* The following helpers have been removed, as they are not available in Padrino
  * `collection_select`
  * `country_select`
  * `time_zone_select`
  * `range_field`
  * Various other additions made to `bootstrap_forms` after `v3`

Bootstrap 2.0 Compliant!
------------------------
A super special thanks to [vincenzor](https://github.com/vincenzor) for updating `bootstrap_forms` to comply with the new methods and features in Twitter Bootstrap 2.0.

Installation
------------
Add it to your `Gemfile`:

    gem 'padrino_bootstrap_forms', :require => 'bootstrap_forms'

Don't forget to run the `bundle` command.

Register it with your application:

    class YourApplication < Padrino::Application
      register BootstrapForms
      # ...
    end

This will add the method `bootstrap_form_for` for use in your project.

Why?
----
With Bootstrap, you would need the following code for a form:

```haml
/ using HAML
= form_for @model do |f|
  .clearfix
    %label MyLabel
    .input
      = f.text_area :field, :opts => {...}
```

Using Bootstrap Forms, this is **much** simpler:

```haml
/ using HAML
= bootstrap_form_for @model do |f|
  = f.text_area :field, :opts => {...}
```

The custom form builder will automatically wrap everything for you. This helps clean up your view layer significantly!

Additional Form Methods
-----------------------
Just when you thought you were done... Bootstrap Forms includes additional form helpers that make life **a lot** easier! For example, the markup required for a list of checkboxes is quite cumbersome... well, it used to be.

### collection_check_boxes
`collection_check_boxes` behaves very similarly to `collection_select`:

```haml
= f.collection_check_boxes :category_ids, Category.all, :id, :name
```

### collection_radio_buttons
See description above...

```haml
= f.collection_radio_buttons :primary_category_id, Category.all, :id, :name
```

### radio_buttons

```haml
= f.radio_buttons :published, { "Published" => true, "Unpublished" => false }
```

Uneditable Input
----------------
Bootstrap Forms adds another helper method that generates the necessary markup for uneditable inputs:

```haml
= f.uneditable_input :name
```

yields:

```html
<div class="clearfix">
  <label for="organization_name">Organization Name</label>
  <div class="input">
    <span class="uneditable-input">The Variety Hour</span>
  </div>
</div>
```

Submit Tag
----------
Bootstrap Forms also adds a default actions panel when you call `f.submit`:

```haml
= f.submit
```

generates:

```html
<div class="actions">
  <input type="submit" value="..." class="btn primary" />
  <a href="..." class="btn">Cancel</a>
</div>
```

You can skip the cancel button by passing the `:include_cancel` button a `false` value.

Pretty swell if you ask me.

Adding More Options
-------------------
You can add as many options to any form helper tag. If they are interpreted by Bootstrap Forms, they are interpreted and rendered in the output. If not, they are passed along as values to the final HTML form object.

### Available Options

<table>
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Usage</th>
  </tr>
  <tr>
    <th>help_inline</th>
    <td>Add inline help text</td>
    <td>= f.text_field :name, :help_inline => 'help me!'</td>
  </tr>
  <tr>
    <th>help_block</th>
    <td>Add block help text (below)</td>
    <td>= f.text_field :name, :help_block => 'help me!'</td>
  </tr>
  <tr>
    <th>error</th>
    <td>Styles the field as error (red)</td>
    <td>= f.text_field :name, :error => 'This is an error!'</td>
  </tr>
  <tr>
    <th>success</th>
    <td>Styles the field as success (green)</td>
    <td>= f.text_field :name, :success => 'This checked out OK'</td>
  </tr>
  <tr>
    <th>info</th>
    <td>Styles the field as info (blue)</td>
    <td>= f.text_field :name, :info => 'Hey, it's OK'</td>
  </tr>
  <tr>
    <th>warning</th>
    <td>Styles the field as warning (yellow)</td>
    <td>= f.text_field :name, :warning => 'Take a look at this...'</td>
  </tr>
  <tr>
    <th>prepend</th>
    <td>Adds special text to the front of the input</td>
    <td>= f.text_field :name, :prepend => '@'</td>
  </tr>
  <tr>
    <th>append</th>
    <td>Adds special text at the end of the input</td>
    <td>= f.text_field :name, :append => '@'</td>
  </tr>
</table>

Contributing
------------
I'm pretty dam active on github. Fork and submit a pull request. Most of my pull requests are merged the same day. Make sure you:

 - **Squash** into a single commit (unless it makes sense to have multiple commits)
 - **Test/Spec** the changes
 - **Document** your changes

License
-------
Copyright (c) 2012 Seth Vargo

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
