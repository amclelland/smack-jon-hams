def tick args
  args.outputs.labels << [ 520, 150, "SMACK JON'S HAMS", 6 ]

  args.outputs.labels << [ 550, 50, "A", 10 ]
  args.outputs.labels << [ 700, 50, "L", 10 ]

  args.state.left_frame ||= 1
  args.state.right_frame ||= 1

  args.outputs.sprites << {
    x: 550,
    y: -150,
    w: 800,
    h: 900,
    path: "sprites/smack.png",
    source_x: (300 * (args.state.right_frame-1)),
    source_y: 0,
    source_w: 300,
    source_h: 800,
  }

  args.outputs.sprites << {
    x: -50,
    y: -150,
    w: 800,
    h: 900,
    path: "sprites/smack.png",
    source_x: (300 * (args.state.left_frame-1)),
    source_y: 0,
    source_w: 300,
    source_h: 800,
  }

  if args.inputs.keyboard.key_down.a
    args.state.left_animate = true
  end

  if args.inputs.keyboard.key_down.l
    args.state.right_animate = true
  end

  if args.state.left_animate
    args.state.left_frame += 1
  end

  if args.state.right_animate
    args.state.right_frame += 1
  end

  if args.state.left_frame == 8
    args.outputs.sounds << "sounds/smack.wav"
  end

  if args.state.right_frame == 8
    args.outputs.sounds << "sounds/smack.wav"
  end

  if args.state.left_animate && args.state.left_frame == 15
    args.state.left_animate = false
    args.state.left_frame = 1
  end

  if args.state.right_animate && args.state.right_frame == 15
    args.state.right_animate = false
    args.state.right_frame = 1
  end
end
