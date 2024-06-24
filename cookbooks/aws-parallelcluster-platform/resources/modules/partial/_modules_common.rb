# frozen_string_literal: true
#
# Copyright:: 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file.
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or implied.
# See the License for the specific language governing permissions and limitations under the License.

unified_mode true

property :line, String, required: %i(append_to_config)

default_action :setup

action :append_to_config do
  append_if_no_line new_resource.name do
    path modulepath_config_file
    line new_resource.line
  end
end

action_class do
  def modulepath_config_file
    "#{modules_home}/init/.modulespath"
  end

  def modules_home
    "/usr/share/Modules"
  end
end
