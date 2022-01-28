#|
 This file is a part of cl-mixed
 (c) 2017 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:cl-user)
(defpackage #:org.shirakumo.fraf.mixed.cffi
  (:use #:cl #:cffi)
  (:shadow #:error)
  ;; low-level.lisp
  (:export
   #:*static*
   #:libmixed
   #:size_t
   #:ssize_t
   #:error
   #:encoding
   #:layout
   #:field
   #:attenuation
   #:fade-type
   #:generator-type
   #:noise-type
   #:repeat-mode
   #:biquad-filter
   #:field-type
   #:info-flags
   #:location
   #:buffer
   #:buffer-data
   #:buffer-size
   #:buffer-size
   #:buffer-read
   #:buffer-write
   #:buffer-reserved
   #:buffer-virtual-p
   #:pack
   #:pack-data
   #:pack-size
   #:pack-encoding
   #:pack-channels
   #:pack-samplerate
   #:pack-size
   #:pack-read
   #:pack-write
   #:pack-reserved
   #:field-info
   #:field-info-field
   #:field-info-description
   #:field-info-flags
   #:field-info-type
   #:field-info-type-count
   #:segment-info
   #:segment-info-name
   #:segment-info-description
   #:segment-info-flags
   #:segment-info-min-inputs
   #:segment-info-max-inputs
   #:segment-info-outputs
   #:segment-info-fields
   #:segment
   #:direct-segment-free
   #:direct-segment-info
   #:direct-segment-start
   #:direct-segment-mix
   #:direct-segment-end
   #:direct-segment-set-in
   #:direct-segment-set-out
   #:direct-segment-get-in
   #:direct-segment-get-out
   #:direct-segment-set
   #:direct-segment-get
   #:direct-segment-data
   #:make-pack
   #:free-pack
   #:clear-pack
   #:pack-available-write
   #:pack-available-read
   #:pack-request-write
   #:pack-finish-write
   #:pack-request-read
   #:pack-finish-read
   #:make-buffer
   #:free-buffer
   #:buffer-from-pack
   #:buffer-to-pack
   #:transfer-buffer
   #:copy-buffer
   #:clear-buffer
   #:resize-buffer
   #:buffer-available-write
   #:buffer-available-read
   #:buffer-request-write
   #:buffer-finish-write
   #:buffer-request-read
   #:buffer-finish-read
   #:resample-nearest
   #:resample-linear
   #:resample-cubic
   #:free-segment
   #:segment-start
   #:segment-mix
   #:segment-end
   #:segment-set-in
   #:segment-set-out
   #:segment-get-in
   #:segment-get-out
   #:segment-set
   #:segment-get
   #:make-segment-basic-mixer
   #:make-segment-channel-convert
   #:make-segment-delay
   #:make-segment-distribute
   #:make-segment-fade
   #:make-segment-biquad-filter
   #:make-segment-gate
   #:make-segment-generator
   #:make-segment-ladspa
   #:make-segment-noise
   #:make-segment-packer
   #:make-segment-pitch
   #:make-segment-plane-mixer
   #:make-segment-quantize
   #:make-segment-quantize
   #:make-segment-queue
   #:make-segment-repeat
   #:make-segment-space-mixer
   #:make-segment-speed-change
   #:make-segment-unpacker
   #:make-segment-void
   #:make-segment-volume-control
   #:make-segment-zero
   #:queue-add
   #:queue-remove
   #:queue-remove-at
   #:queue-clear
   #:make-segment-chain
   #:chain-add
   #:chain-add-at
   #:chain-remove
   #:chain-remove-at
   #:make-segment-spatial-reverb
   #:load-plugin
   #:close-plugin
   #:register-segment
   #:deregister-segment
   #:list-segments
   #:make-segment-info
   #:make-segment
   #:samplesize
   #:translator-from
   #:translator-to
   #:error
   #:error-string
   #:type-string
   #:version))

(defpackage #:org.shirakumo.fraf.mixed
  (:use #:cl #:cffi)
  (:import-from #:org.shirakumo.fraf.mixed.cffi #:size_t)
  (:shadow #:space #:byte-position)
  (:local-nicknames
   (#:mixed #:org.shirakumo.fraf.mixed.cffi))
  ;; bip-buffer.lisp
  (:export
   #:available-read
   #:available-write
   #:request-write
   #:finish-write
   #:request-read
   #:finish-read
   #:data-ptr
   #:with-buffer-tx
   #:finish
   #:with-buffer-transfer)
  ;; buffer.lisp
  (:export
   #:buffer
   #:make-buffer
   #:data
   #:size
   #:clear
   #:with-buffers
   #:transfer)
  ;; c-object.lisp
  (:export
   #:handle
   #:c-object
   #:free
   #:pointer->object
   #:with-objects)
  ;; drain.lisp
  (:export
   #:drain
   #:program-name
   #:pack
   #:channel-order
   #:device-drain
   #:list-devices
   #:device)
  ;; mixer.lisp
  (:export
   #:mixer
   #:sources
   #:source)
  ;; pack.lisp
  (:export
   #:pack
   #:make-pack
   #:data
   #:size
   #:encoding
   #:channels
   #:samplerate
   #:transfer
   #:clear
   #:framesize)
  ;; segment.lisp
  (:export
   #:segment
   #:revalidate
   #:inputs
   #:outputs
   #:info
   #:start
   #:mix
   #:end
   #:input-field
   #:output-field
   #:field
   #:input
   #:output
   #:connect
   #:match-channel-order)
  ;; source.lisp
  (:export
   #:source
   #:pack
   #:byte-position
   #:done-p
   #:seek
   #:seek-to-frame
   #:frame-position
   #:frame-count)
  ;; toolkit.lisp
  (:export
   #:*default-samplerate*
   #:*default-channel-order*
   #:mixed-error
   #:error-code
   #:samplesize
   #:guess-channel-order-from-count)
  ;; segments/basic-mixer.lisp
  (:export
   #:basic-mixer
   #:channels
   #:make-basic-mixer
   #:volume)
  ;; segments/biquad-filter.lisp
  (:export
   #:biquad-filter
   #:make-biquad-filter
   #:frequency
   #:filter
   #:samplerate
   #:bypass
   #:q
   #:gain)
  ;; segments/bundle.lisp
  (:export
   #:bundle
   #:make-bundle)
  ;; segments/chain.lisp
  (:export
   #:chain
   #:segments
   #:make-chain
   #:bypass
   #:add
   #:withdraw
   #:with-chain)
  ;; segments/channel-convert.lisp
  (:export
   #:channel-convert
   #:make-channel-convert)
  ;; segments/delay.lisp
  (:export
   #:delay
   #:make-delay
   #:duration
   #:samplerate
   #:bypass)
  ;; segments/distribute.lisp
  (:export
   #:distributor
   #:make-distributor)
  ;; segments/fader.lisp
  (:export
   #:fader
   #:make-fader
   #:from
   #:to
   #:duration
   #:fade-type
   #:bypass)
  ;; segments/gate.lisp
  (:export
   #:gate
   #:make-gate
   #:samplerate
   #:open-threshold
   #:close-threshold
   #:attack
   #:hold
   #:release
   #:bypass)
  ;; segments/generator.lisp
  (:export
   #:generator
   #:make-generator
   #:volume
   #:wave-type
   #:frequency)
  ;; segments/ladspa.lisp
  (:export
   #:ladspa
   #:make-ladspa
   #:field)
  ;; segments/noise.lisp
  (:export
   #:noise
   #:make-noise
   #:volume
   #:noise-type)
  ;; segments/null.lisp
  (:export
   #:void
   #:make-void
   #:zero
   #:make-zero)
  ;; segments/packer.lisp
  (:export
   #:packer
   #:pack
   #:make-packer
   #:data
   #:size
   #:encoding
   #:channels
   #:layout
   #:samplerate
   #:volume
   #:bypass)
  ;; segments/pitch.lisp
  (:export
   #:pitch
   #:make-pitch
   #:pitch
   #:samplerate
   #:bypass
   #:wet)
  ;; segments/plane-mixer.lisp
  (:export
   #:plane-mixer
   #:make-plane-mixer
   #:location
   #:velocity
   #:input-location
   #:input-velocity
   #:input-min-distance
   #:input-max-distance
   #:input-rolloff
   #:soundspeed
   #:doppler-factor
   #:min-distance
   #:max-distance
   #:rolloff
   #:volume
   #:field
   #:attenuation)
  ;; segments/quantize.lisp
  (:export
   #:quantize
   #:make-quantize
   #:steps
   #:bypass
   #:wet)
  ;; segments/queue.lisp
  (:export
   #:queue
   #:make-queue
   #:current-segment
   #:in-count
   #:out-count
   #:bypass
   #:add
   #:withdraw
   #:clear)
  ;; segments/repeat.lisp
  (:export
   #:repeat
   #:make-repeat
   #:duration
   #:repeat-mode
   #:samplerate
   #:bypass)
  ;; segments/space-mixer.lisp
  (:export
   #:space-mixer
   #:make-space-mixer
   #:location
   #:velocity
   #:direction
   #:up
   #:input-location
   #:input-velocity
   #:input-min-distance
   #:input-max-distance
   #:input-rolloff
   #:soundspeed
   #:doppler-factor
   #:min-distance
   #:max-distance
   #:rolloff
   #:volume
   #:field
   #:attenuation)
  ;; segments/spatial-reverb.lisp
  (:export
   #:spatial-reverb
   #:make-spatial-reverb
   #:distance-delay
   #:max-distance
   #:set-parameters
   #:add-spatial-probe)
  ;; segments/speed-change.lisp
  (:export
   #:speed-change
   #:make-speed-change
   #:speed-factor
   #:bypass)
  ;; segments/unpacker.lisp
  (:export
   #:unpacker
   #:pack
   #:make-unpacker
   #:data
   #:size
   #:encoding
   #:channels
   #:layout
   #:samplerate
   #:volume
   #:bypass)
  ;; segments/virtual.lisp
  (:export
   #:virtual
   #:info
   #:start
   #:mix
   #:end
   #:input-field
   #:output-field
   #:field)
  ;; segments/volume-control.lisp
  (:export
   #:volume-control
   #:make-volume-control
   #:volume
   #:pan
   #:bypass))
