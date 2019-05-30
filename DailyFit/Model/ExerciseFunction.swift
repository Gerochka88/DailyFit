//
//  ExerciseFunction.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/18/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class ExerciseFunction {
    static func addData(exerciseModel: ExercisesModel){
        ExerciseManager.exerciseModels.append(exerciseModel)
    }

    static func getData(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            ExerciseManager.exerciseModels.append(ExercisesModel(title: "Leg press", subTitle: "Legs", image: UIImage(named: "legpress"), description: "Using a leg press machine, sit down on the machine and place your legs on the platform directly in front of you at a medium (shoulder width) foot stance. (Note: For the purposes of this discussion we will use the medium stance described above which targets overall development; however you can choose any of the three stances described in the foot positioning section)."))
            ExerciseManager.exerciseModels.append(ExercisesModel(title: "Squats", subTitle: "Legs", image: UIImage(named: "squats"), description: "Find a foot stance that feels best for you. Pointing your toes slightly outwards helps some, but keeping them parallel is fine, too. If you’re not sure what’s best, start by putting your feet shoulder-width apart and pointed about 15 degrees outwards.Tense your abs like someone is about to punch you.Look straight ahead and stand tall!"))
            ExerciseManager.exerciseModels.append(ExercisesModel(title: "Burpees", subTitle: "Legs", image: UIImage(named: "burpees"), description:  "Your feet should be shoulder-width apart. Now, lower your body into a squatting position, placing your hands on the floor in front of you.Kick your feet back so that you are in push-up position. Beginners or those uncomfortable kicking their feet back can walk back into the pushup position. Keep your hands firmly on the ground to support your body.Lower your chest to do a push-up. Bring your chest back up.Kick your feet back to their original position. Beginners or those uncomfortable kicking their feet back can walk back into the original position. Stand up, and then jump into the air while clapping your arms overhead.Repeat. Do 15 reps to complete one set. If you are a beginner or are out of shape, start off with 5 burpees in a row."))
            ExerciseManager.exerciseModels.append(ExercisesModel(title: "Deadlift", subTitle: "Legs", image: UIImage(named: "deadlift"), description: "Stand with your mid-foot under the barbell Bend over and grab the bar with a shoulder-width grip Bend your knees until your shins touch the bar Lift your chest up and straighten your lower back Take a big breath, hold it, and stand up with the weight"))
           ExerciseManager.exerciseModels.append(ExercisesModel(title: "Dumbbell Lunge", subTitle: "Legs", image: UIImage(named: "dumbbelllunge"), description: "Stand with your torso upright holding two dumbbells in your hands by your sides. This will be your starting position. Step forward with your right leg around 2 feet or so from the foot being left stationary behind and lower your upper body down, while keeping the torso upright and maintaining balance. Inhale as you go down. Note: As in the other exercises, do not allow your knee to go forward beyond your toes as you come down, as this will put undue stress on the knee joint. Make sure that you keep your front shin perpendicular to the ground. Using mainly the heel of your foot, push up and go back to the starting position as you exhale. Repeat the movement for the recommended amount of repetitions and then perform with the left leg."))
            ExerciseManager.exerciseModels.append(ExercisesModel(title: "Hack Squat", subTitle: "Legs", image: UIImage(named: "hacksquat"), description: "Place the back of your torso against the back pad of the machine and hook your shoulders under the shoulder pads provided. Position your legs in the platform using a shoulder width medium stance with the toes slightly pointed out. Tip: Keep your head up at all times and also maintain the back on the pad at all times. Place your arms on the side handles of the machine and disengage the safety bars (which on most designs is done by moving the side handles from a facing front position to a diagonal position). Now straighten your legs without locking the knees. This will be your starting position. (Note: For the purposes of this discussion we will use the medium stance described above which targets overall development; however you can choose any of the three stances described in the foot positioning section). Begin to slowly lower the unit by bending the knees as you maintain a straight posture with the head up (back on the pad at all times). Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly. Begin to raise the unit as you exhale by pushing the floor with mainly with the heel of your foot as you straighten the legs again and go back to the starting position. Repeat for the recommended amount of repetitions."))
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
