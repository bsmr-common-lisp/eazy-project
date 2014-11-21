#|
  This file is a part of <% @var name %> project.
<% @if author %>  Copyright (c) <%= (local-time:timestamp-year (local-time:now)) %> <% @var author %><% @if email %> (<% @var email %>)<% @endif %>
<% @endif %>|#
<%
(when (or (getf env :description)
          (getf env :author))
%>
#|<% @if description %>
  <% @var description %><% @endif %><% @if author %>
<% (when (and (getf env :description) (getf env :author)) %>
<% ) %>  Author: <% @var author %><% @if email %> (<% @var email %>)<% @endif %><% @endif %>
|#
<% ) %>

<% @unless asdf3 %>
(in-package :cl-user)
(defpackage <% @var name %>-asd
  (:use :cl :asdf))
(in-package :<% @var name %>-asd)
<% @endunless %>

(defsystem <% @var name %>
  :version "0.1"
  :author "<% @var author %>"
  :mailto "<% @var email %>"
  :license "<% @var license %>"
  :depends-on (<% (format t "~{:~(~A~)~^ ~}" (getf env :depends-on)) %>)
  :components ((:module "<% @var source-dir %>"
                :components
                ((:file "package"))))
  :description "<% @var description %>"
  :in-order-to ((test-op (load-op <% @var test-name %>))))