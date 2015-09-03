def key_pattern_hash
	{
		"Age" => /age/,
		"Gender" => /gender/,
		"Prior convictions" => /priors/,
		"Open or pending" => /pending/,
		"Recommended for release" => /cjarec/,
		# "Case info - specific charges" => /arrestchg/,
		"Case info - charge severity" => /arrestsev/,
		"Case info - arrest type" => /arrestCJAtyp/,
		"Borough of arrest" => /county/,
		"Desk appearance given by police" => /priorarr/,
		"Release outcome at arraignment" => /arrelst/,
		"Disposition of case" => /disp1yr/,
		"Sentence imposed" => /sent1yr/
	}
end

def age
	{
		0 => "16-19",
		1 => "20-24",
		2 => "25-30",
		3 => "31-34",
		4 => "35-39",
		5 => "40+"
	}
end

def gender
	{
		0 => "Male",
		1 => "Female"
	}
end

def priors
	{
		0 => "No prior criminal convictions",
		1 => "One or more misdemeanor convictions but no felony convictions",
		2 => "One or more felony convictions but no misdemeanor convictions",
		3 => "Both misdemeanor and felony convictions",
		4 => "Criminal history information not available"
	}
end

def open_pending
	{
		0 => "Yes",
		1 => "No",
		2 => "Criminal history information not available"
	}
end

def recommended_for_release
	{
		0 => "Recommended for release on recognizance",
		1 => "Moderate risk of failure to appear",
		2 => "High risk of failure to appear - not recommended for release",
		3 => "Recommendation not avialable"
	}
end

def charge_severity
	{
		0 => "Violent Felony Offense or Violent Class A Felony",
		1 => "Non-Violent Felony",
		2 => "Misdemeanor"
	}	
end

def type_of_top_arrest_charge
	{
		0 => "Drug crime",
		1 => "Harm to persons",
		2 => "Harm to persons and property",
		3 => "Obstruction of justice",
		4 => "Property crime",
		5 => "Prostitution or obscenity",
		6 => "Theft of services, forgery or fraud",
		7 => "Trespassing or other misconduct",
		8 => "Vehicle and Traffic Law crime,",
		9 => "Weapon possession or sale",
		10 => "Other",
	}
end

def borough_of_arrest
	{
		0 => "Bronx",
		1 => "Brooklyn",
		2 => "Manhattan",
		3 => "Queens",
		4 => "Staten Island"
	}
end

def desk_appearance_ticket
	{
		0 => "Yes DAT -- Defendant released at arrest",
		1 => "No DAT -- Defendant held at arrest"
	}
end

def release_outcome
	{
		0 => "Released on recognizance (released without bail)",
		1 => "Bail set and made at arraignment",
		2 => "Bail set and not made at arraignment",
		3 => "Remanded (held without bail)",
		4 => "Failed to appear on DAT -- bench warrant ordered",
		5 => "Case disposed at arraignment"
	}
end

def disposition_of_case
	{
		0 => "Dismissed / acquitted",
		1 => "Adjourned in Contemplation of Dismissal",
		2 => "Convicted (of some offense)",
		3 => "Other disposition or case still pending"
	}
end

def sentence_imposed
	{
		0 => "Jail or prison",
		1 => "Probation",
		2 => "Conditional discharge or fine",
		3 => "Defendant pled/found guilty but sentence pending",
		4 => "Not convicted"
	}
end

def hash_hash
	{
		"Age" => age,
		"Gender" => gender,
		"Prior convictions" => priors,
		"Open or pending" => open_pending,
		"Recommended for release" => recommended_for_release,
		# "Case info - specific charges" => spex,
		"Case info - charge severity" => charge_severity,
		"Case info - arrest type" => type_of_top_arrest_charge,
		"Borough of arrest" => borough_of_arrest,
		"Desk appearance given by police" => desk_appearance_ticket,
		"Release outcome at arraignment" => release_outcome,
		"Disposition of case" => disposition_of_case,
		"Sentence imposed" => sentence_imposed
	}
end
