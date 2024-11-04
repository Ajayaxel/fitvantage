import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_app/lifestylequestiner/model/lifestylequestionnairemodel.dart';
import 'package:my_app/utils/auth_exceptions.dart';

final response =



{
    "code": 200,
    "message": "Data fetched successfully",
    "data": [
        {
            "category_id": 1,
            "category_name": "Movement",
            "category_description": "Movement includes all physical activities like exercise, walking, and stretching that enhance overall physical well-being.",
            "questions": [
                {
                    "question_id": 1,
                    "question_name": "I walk regularly",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 1,
                            "option_name": "Not Regular",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 2,
                            "option_name": "Sometimes",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 3,
                            "option_name": "3000-5000 steps (30-45 mins) daily",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 4,
                            "option_name": "5000-7500 steps daily (~60 mins)",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 5,
                            "option_name": "7500-10,000 steps daily (~90 mins)",
                            "option_description": null,
                            "score": 4
                        },
                        {
                            "option_id": 6,
                            "option_name": ">10,000 steps Daily (~2hrs)",
                            "option_description": null,
                            "score": 5
                        }
                    ]
                },
                {
                    "question_id": 2,
                    "question_name": "I do some form of structured workouts regularly",
                    "question_description": "E.g., strength workouts, cardio workouts, yoga, S&C, HRX, dance fitness, boxing etc.",
                    "options": [
                        {
                            "option_id": 7,
                            "option_name": "Almost never",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 8,
                            "option_name": "Sometimes",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 9,
                            "option_name": "15-30 mins 3-5 days per week",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 10,
                            "option_name": ">30 mins 3-4 days per week",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 11,
                            "option_name": "At least 50-60 mins 5-6 days per week",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 3,
                    "question_name": "I am active throughout the day",
                    "question_description": "This is excluding my structured workouts. E.g., moving around, doing daily chores, fiddling, standing, taking stairs etc.",
                    "options": [
                        {
                            "option_id": 12,
                            "option_name": "Almost never during the days",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 13,
                            "option_name": "Sometimes during the days",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 14,
                            "option_name": "Move for 1-2 mins every 60 mins",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 15,
                            "option_name": "Move for 3-5 mins every 60 mins",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 16,
                            "option_name": "Move for 3-5 mins every 30-45 mins",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 4,
                    "question_name": "I play a recreational sport regularly that I enjoy",
                    "question_description": "E.g., badminton, football, basketball, cricket, cycling, tennis, etc.",
                    "options": [
                        {
                            "option_id": 17,
                            "option_name": "Almost never in 2-4 weeks",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 18,
                            "option_name": "Sometimes in 2-4 weeks",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 19,
                            "option_name": "At least once every 2 weeks",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 20,
                            "option_name": "At least once a week for 30-60 mins",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 21,
                            "option_name": "At least once a week for 60 mins or more",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                }
            ]
        },
        {
            "category_id": 2,
            "category_name": "Nutrition",
            "category_description": "Nutrition focuses on healthy eating habits, balanced diets, and proper intake of essential nutrients for optimal health.",
            "questions": [
                {
                    "question_id": 5,
                    "question_name": "I include 1-2 portion of fresh, lean source protein at meals",
                    "question_description": "E.g. lentils, pulses, legumes, tofu, lean meat such as chicken or fish, eggs, paneer, buttermilk etc.; 1 portion means a katori (150 ml) or a glass (200 ml) or a bowl (250 gms)",
                    "options": [
                        {
                            "option_id": 22,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 23,
                            "option_name": "A few meals a week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 24,
                            "option_name": "1 meal daily",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 25,
                            "option_name": "2 meals daily",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 26,
                            "option_name": "Almost all meals daily",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 6,
                    "question_name": "I include 1-2 portion of fresh, differently colored vegetables (cooked or raw) and/or whole fruits at meals",
                    "question_description": "1 portion = katori (150 ml) or bowl (100 gms) or 1 medium whole fruit",
                    "options": [
                        {
                            "option_id": 27,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 28,
                            "option_name": "A few meals a week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 29,
                            "option_name": "1 meal daily",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 30,
                            "option_name": "2 meals daily",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 31,
                            "option_name": "Almost all meals daily",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 7,
                    "question_name": "I eat appropriate amount of healthy fats for my needs, preferences, and goals",
                    "question_description": "E.g. nuts / nut butters, seeds, olive oil, avocados, etc.",
                    "options": [
                        {
                            "option_id": 32,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 33,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 34,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 35,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 36,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 8,
                    "question_name": "I eat appropriate amounts of slow-digesting, high-fiber carbs for my needs, preferences, and goals",
                    "question_description": "E.g. whole fruits, potatoes, sweet potatoes, whole grains such as millets, quinoa, oats, muesli etc.",
                    "options": [
                        {
                            "option_id": 37,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 38,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 39,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 40,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 41,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 9,
                    "question_name": "I eat balanced meals",
                    "question_description": "~50% Veg+Fruits, 25% quality carbs, 25% lean proteins",
                    "options": [
                        {
                            "option_id": 42,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 43,
                            "option_name": "A few meals a week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 44,
                            "option_name": "1 meal daily",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 45,
                            "option_name": "2 meals daily",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 46,
                            "option_name": "Almost all meals daily",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 10,
                    "question_name": "I eat whole, minimally processed foods during weekends or when eating out",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 47,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 48,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 49,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 50,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 51,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 11,
                    "question_name": "Whenever I snack, I choose healthier options",
                    "question_description": "E.g. sprouts, fruits, nuts, smoothies, whole grain sandwiches etc.",
                    "options": [
                        {
                            "option_id": 52,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 53,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 54,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 55,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 56,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 12,
                    "question_name": "I am aware of my nutritional deficiencies and supplement appropriately as prescribed by a medical professional",
                    "question_description": "E.g. Vitamin D, Vit B12, Zinc, Folic Acid, Magnesium, Protein Powder etc.",
                    "options": [
                        {
                            "option_id": 57,
                            "option_name": "No",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 58,
                            "option_name": "Yes",
                            "option_description": null,
                            "score": 1
                        }
                    ]
                },
                {
                    "question_id": 13,
                    "question_name": "I take time to eat my food slowly, and chew it well",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 59,
                            "option_name": "I eat quickly",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 60,
                            "option_name": "10-20 min at 1-2 meals a day",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 61,
                            "option_name": "10-20 mins at most meals per day",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 62,
                            "option_name": "More than 20 mins at most meals per day",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 63,
                            "option_name": "More than 20 mins at all meals per day",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 14,
                    "question_name": "I eat my food mindfully, with few distractions. I notice the taste and texture of my food",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 64,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 65,
                            "option_name": "A few meals a week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 66,
                            "option_name": "1 meal daily",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 67,
                            "option_name": "2 meals daily",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 68,
                            "option_name": "Almost all meals daily",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 15,
                    "question_name": "I stop eating once I am 80% full",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 69,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 70,
                            "option_name": "A few meals a week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 71,
                            "option_name": "1 meal daily",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 72,
                            "option_name": "2 meals daily",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 73,
                            "option_name": "Almost all meals daily",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 16,
                    "question_name": "I practice time-restricted eating",
                    "question_description": "Keep a gap of 10-12 hrs between dinner and next day breakfast",
                    "options": [
                        {
                            "option_id": 74,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 75,
                            "option_name": "1-2 days/week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 76,
                            "option_name": "3-4 days/week",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 77,
                            "option_name": "5-6 days/week",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 78,
                            "option_name": "Daily",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 17,
                    "question_name": "My food environment supports my nutrition goals",
                    "question_description": "E.g., I keep healthy food in the house or easily available, and keep problematic foods out of the house or out of sight.",
                    "options": [
                        {
                            "option_id": 79,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 80,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 81,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 82,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 83,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 18,
                    "question_name": "I purposefully plan my home-cooked healthy meals",
                    "question_description": "I know what I will eat and order groceries accordingly",
                    "options": [
                        {
                            "option_id": 84,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 85,
                            "option_name": "1-2 days/week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 86,
                            "option_name": "3-4 days/week",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 87,
                            "option_name": "5-6 days/week",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 88,
                            "option_name": "Almost all meals per week",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 19,
                    "question_name": "I prep my meals ahead of time",
                    "question_description": "Or I have a trusted system such as cook, tiffin system, meal delivery for the same",
                    "options": [
                        {
                            "option_id": 89,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 90,
                            "option_name": "1-2 days/week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 91,
                            "option_name": "3-4 days/week",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 92,
                            "option_name": "5-6 days/week",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 93,
                            "option_name": "Almost all meals per week",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 20,
                    "question_name": "I stay well hydrated by drinking at least 2-3 Liters of water/fluids daily",
                    "question_description": "I know because the color of my urine is generally clear",
                    "options": [
                        {
                            "option_id": 94,
                            "option_name": "No",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 95,
                            "option_name": "Yes",
                            "option_description": null,
                            "score": 1
                        }
                    ]
                },
                {
                    "question_id": 21,
                    "question_name": "I drink low-calories, minimally-processed beverages with minimal added sugars",
                    "question_description": "E.g. fresh vegetable or fruit juices, plain coffee or tea, green or herbal teas, smoothies etc.",
                    "options": [
                        {
                            "option_id": 96,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 97,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 98,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 99,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 100,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 22,
                    "question_name": "I drink alcohol moderately or don't drink at all",
                    "question_description": "1 drink means 350ml beer or 120ml wine or 30 ml of 80-proof spirits like whiskey",
                    "options": [
                        {
                            "option_id": 101,
                            "option_name": "More than 7 drinks per week",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 102,
                            "option_name": "1 drink daily",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 103,
                            "option_name": "3-4 drinks a week",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 104,
                            "option_name": "1-2 drinks a week",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 105,
                            "option_name": "Rarely or never drink",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                }
            ]
        },
        {
            "category_id": 3,
            "category_name": "Stress",
            "category_description": "Stress management is about reducing stress and learning relaxation techniques for mental and emotional well-being.",
            "questions": [
                {
                    "question_id": 23,
                    "question_name": "In the last 30 days, I have generally been?",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 106,
                            "option_name": "Very Stressed",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 107,
                            "option_name": "Stressed",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 108,
                            "option_name": "A bit of both, calm and Very stressed",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 109,
                            "option_name": "Calm",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 110,
                            "option_name": "Very Calm",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 24,
                    "question_name": "I make time for healthy habits by planning ahead?",
                    "question_description": "Eg. exercise, self-care practices, healthy eating etc.",
                    "options": [
                        {
                            "option_id": 111,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 112,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 113,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 114,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 115,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 25,
                    "question_name": "I purposefully optimize my digital screen time?",
                    "question_description": "Eg. minimize social media browsing or phone use during the day etc.",
                    "options": [
                        {
                            "option_id": 116,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 117,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 118,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 119,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 120,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 26,
                    "question_name": "I keep my home and work spaces relatively organized, and intentionally set it up to support my goals and minimize stress?",
                    "question_description": "Eg. declutter my room or work space etc.",
                    "options": [
                        {
                            "option_id": 121,
                            "option_name": "Not at all",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 122,
                            "option_name": "1-2 days a week",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 123,
                            "option_name": "3-4 days per week",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 124,
                            "option_name": "5-6 days per week",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 125,
                            "option_name": "Daily",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 27,
                    "question_name": "I practice meditation or some form of mindfulness during the week?",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 126,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 127,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 128,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 129,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 130,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 28,
                    "question_name": "I purposefully relax, have fun, and de-stress during the week?",
                    "question_description": "Eg. minimize social media browsing or phone use during the day etc.",
                    "options": [
                        {
                            "option_id": 131,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 132,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 133,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 134,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 135,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                }
            ]
        },
        {
            "category_id": 4,
            "category_name": "Sleep",
            "category_description": "Sleep includes practices to improve sleep quality and overall rest to promote mental and physical recovery.",
            "questions": [
                {
                    "question_id": 29,
                    "question_name": "I usually sleep?",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 136,
                            "option_name": "Less than 4 hours each night",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 137,
                            "option_name": "4-5 hours each night",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 138,
                            "option_name": "5-6 hours each night",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 139,
                            "option_name": "6-7 hours each night",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 140,
                            "option_name": "More than 7 hours each night",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 30,
                    "question_name": "I have trouble falling or staying asleep?",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 141,
                            "option_name": "Always",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 142,
                            "option_name": "Most nights or days",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 143,
                            "option_name": "Occasionally",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 144,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 145,
                            "option_name": "Never",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 31,
                    "question_name": "I feel fatigued or low on energy when I'm awake?",
                    "question_description": null,
                    "options": [
                        {
                            "option_id": 146,
                            "option_name": "Always",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 147,
                            "option_name": "Most nights or days",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 148,
                            "option_name": "Occasionally",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 149,
                            "option_name": "Rarely",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 150,
                            "option_name": "Never",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 32,
                    "question_name": "My sleep environment helps me get a good night's sleep?",
                    "question_description": "E.g., dark, quiet, cool, uncluttered, comfortable sleeping space, etc.",
                    "options": [
                        {
                            "option_id": 151,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 152,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 153,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 154,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 155,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 33,
                    "question_name": "I plan my bed time to try for plenty of high-quality sleep?",
                    "question_description": "7-9 hours of sleep",
                    "options": [
                        {
                            "option_id": 156,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 157,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 158,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 159,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 160,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                },
                {
                    "question_id": 34,
                    "question_name": "I practice bedtime rituals to prepare for sleep?",
                    "question_description": "E.g., turn off electronics 30 minutes before bedtime, avoid caffeine and alcohol near bedtime, dim the lights, etc.",
                    "options": [
                        {
                            "option_id": 161,
                            "option_name": "Strongly Disagree",
                            "option_description": null,
                            "score": 0
                        },
                        {
                            "option_id": 162,
                            "option_name": "Disagree",
                            "option_description": null,
                            "score": 1
                        },
                        {
                            "option_id": 163,
                            "option_name": "Neutral",
                            "option_description": null,
                            "score": 2
                        },
                        {
                            "option_id": 164,
                            "option_name": "Agree",
                            "option_description": null,
                            "score": 3
                        },
                        {
                            "option_id": 165,
                            "option_name": "Strongly Agree",
                            "option_description": null,
                            "score": 4
                        }
                    ]
                }
            ]
        }
    ]
}
;

class  QuestionairRepo {
  final _dio =Dio();
  Future<Either<AppException, LifeStyleQustionairModel>> getQuestionair() async {
  try {
// final response =await _dio.get(EndPoints.lifeStyleQuestionair,

// options: Options(
//   headers: {'Token':''}
// ));
    return  Right(LifeStyleQustionairModel.fromJson(response) );
  } catch (e) {
    return Left(ExceptionFilter.filterException(e));
  }
}


}

