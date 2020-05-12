# frozen_string_literal: true

module Tude
  class Application < Rails::Application
    config.group_types = ["Assembly",
                          "Committee",
                          "Department",
                          "Functional Team",
                          "Strategic Steering Team",
                          "Working Group"]

    config.page_layouts = ["None",
                            "Email",
                            # "Form Other"
                            # "Publication",
                            # "Orgchart",
                          ]

    config.finding_aid_subjects = ["African Americans",
                                    "Agriculture",
                                    "Arts and Entertainment",
                                    "Benevolent Societies",
                                    "Business And Economic Development",
                                    "Community Affairs",
                                    "Congregations",
                                    "Crime and the Legal System",
                                    "Culture",
                                    "Education",
                                    "Health",
                                    "Housing",
                                    "Immigrant-Ethnic Communities",
                                    "Labor",
                                    "Miscellaneous",
                                    "News Media",
                                    "Planning",
                                    "Politics and Protest",
                                    "Rabbis",
                                    "Senior Citizens",
                                    "Social Services",
                                    "Sports and Recreation",
                                    "Transportation",
                                    "Travel",
                                    "Women"]

    config.policy_categories = ["Access Guidelines",
                                "Borrowers",
                                "Collection Development & Management Guidelines",
                                "Conduct",
                                "Miscellaneous",
                                "Confidentiality & Privacy"]

    config.highlight_types = ["DSC Event",
                              "Featured Staff",
                              "Featured Resource",
                              "Featured Location",
                              "HSL Highlight",
                              "Program/Event",
                              "Staff Recommendation"]

    config.service_types = ["Access to collections & resource sharing",
                            "Building & space use",
                            "Digital scholarship",
                            "Publishing Services",
                            "Research & instruction support",
                            "Research data services",
                            "Scholarly communication",
                            "Technology use & support"]

    config.audience_types = ["Alumni",
                             "Continuing education students",
                             "Faculty",
                             "Graduate students",
                             "Instructors",
                             "Non-credit students",
                             "Pennsylvania residents",
                             "Students w/ disabilities",
                             "Temple University Hospital employees",
                             "Temple University Hospital residents",
                             "Undergraduate students",
                             "University staff & administration",
                             "Visitors & community members",
                             "Visiting scholars"]

    config.specialties = [  "Advertising",
                            "Africology & African-American Studies",
                            "American Studies",
                            "Anthropology",
                            "Architecture",
                            "Art",
                            "Art Education",
                            "Art History",
                            "Asian Studies",
                            "Bioengineering",
                            "Biology",
                            "Biomedical Science",
                            "Business",
                            "Chemistry",
                            "Civil & Environmental Engineering",
                            "Classics",
                            "Communication & Social Influence",
                            "Communication Management",
                            "Communication Sciences & Disorders",
                            "Communication Studies",
                            "Computer & Information Sciences",
                            "Criminal Justice",
                            "Dance",
                            "Dentistry",
                            "Earth & Environmental Science",
                            "Economics",
                            "Education",
                            "Electrical & Computer Engineering",
                            "English",
                            "Environmental Studies",
                            "FIlm & Media Arts",
                            "Gender, Sexuality & Women's Studies",
                            "Geographic Information Systems (GIS)",
                            "Geography & Urban Studies",
                            "German",
                            "Global Studies",
                            "Government Information",
                            "History",
                            "Horticulture",
                            "Jewish Studies",
                            "Journalism",
                            "Kinesiology",
                            "Landscape Architecture",
                            "Latin American Studies",
                            "Law",
                            "LGBT Studies",
                            "Mathematics",
                            "Mechanical Engineering",
                            "Media Studies & Production",
                            "Medicine",
                            "Music",
                            "Music Education",
                            "Music Therapy",
                            "Neuroscience",
                            "Nursing",
                            "Pharmacy",
                            "Philosophy",
                            "Physical Therapy",
                            "Physician Assistant",
                            "Physics",
                            "Planning & Community Development",
                            "Podiatric Medicine",
                            "Political Science",
                            "Portuguese",
                            "Postbaccalaureate Pre-Health",
                            "Postbaccalaureate Pre-Med",
                            "Psychology",
                            "Public Health",
                            "Public Policy",
                            "Public Relations",
                            "Rehabilitation Sciences",
                            "Religion",
                            "Social Work",
                            "Sociology",
                            "Spanish",
                            "Sport, Tourism & Hospitality Management",
                            "Theater",
                            "Urban Bioethics"]


    config.affiliation = [  "Temple Graduate Student",
                            "Temple Undergraduate",
                            "Temple Faculty",
                            "Temple Alumna/us",
                            "Temple Staff",
                            "Non-Temple Undergraduate",
                            "Non-Temple Graduate Student",
                            "Non-Temple Faculty",
                            "General Public"]
  end
end