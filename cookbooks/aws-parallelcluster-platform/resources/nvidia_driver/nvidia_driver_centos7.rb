# frozen_string_literal: true

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

provides :nvidia_driver, platform: 'centos' do |node|
  node['platform_version'].to_i == 7
end

use 'partial/_nvidia_driver_common.rb'

def nvidia_driver_enabled?
  !arm_instance? && nvidia_enabled?
end

# Pinning the Nvidia Driver version for centos7 due to incompatibility with Gdrcopy 2.3.1
def _nvidia_driver_version
  '535.129.03'
end
